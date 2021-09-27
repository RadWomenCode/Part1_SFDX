public with sharing class AccountTriggerHandler {
    
    public static void handleBeforeInsert(List<Account> newAccounts){
        for (Account a : newAccounts) {
            if (a.Est_Annual_Sales__c >= 5000000) {
                a.Priority__c = 'Highest';
            } else if (a.Est_Annual_Sales__c >= 3000000) {
                a.Priority__c = 'High';
            } else if (a.Est_Annual_Sales__c >= 1000000) {
                a.Priority__c = 'Standard';
            } else {
                a.Priority__c = 'Low';
            }
        }
        //this is a before trigger, so our handler doesn't have to call DML
    }

    public static void handleAfterInsert(List<Account> newAccounts){
        
        Id runningUserId = UserInfo.getUserId();
        //Homework - bulkify this code
        for (Account a : newAccounts) {
            Case c = new Case();
            c.Status = 'New';
            c.Origin = 'New Account'; //Make sure you've added this as a picklist value for this field
            c.Subject = 'Send Welcome Package';
            c.AccountId = a.Id;
            c.Description = 'Please follow up with this new Account and send them a Welcome Package.';

            //Get the email address for the Account owner
            User u = [SELECT Id, Email FROM User WHERE Id = :runningUserId];
            c.Staff_Email_Address__c = u.Email;
            insert c;
        }
    }

    public static void handleAfterUpdate(List<Account> acctsForUpdate, Map<Id, Account> oldAcctMap){
        //First thing we do is query for all the opportunities on accounts involved in this trigger
        //The SOQL query below uses a nested query, this let's us pull back each acccount with a list of its opportunities attached.
        //We won't be covering nested queries in this class, but take a look and see if you can figure out how they work
        Map<Id, Account> acctsWithOpps = new Map<Id, Account>(
            [SELECT Id, (SELECT Id FROM Opportunities WHERE IsClosed = false) FROM Account WHERE Id IN :acctsForUpdate]
        );

        //Let's make a list to hold any opportunities we create for later insertion
        List<Opportunity> newOpportunities = new List<Opportunity>();

        //Now we need to loop through the accounts in this trigger and see if their priority has been changed in the way we're looking for
        for (Account updatedAcct : acctsForUpdate) {

            //ok, so now we have the udpated Account record, but we also need to compare it to the old version to see what has changed
            //We can use the oldAccountMap, pass it the Account Id, and we'll get the old version for comparison
            Account oldAcct = oldAcctMap.get(updatedAcct.Id);

            //ok, now we have the new and old versions of the same record and we can make our comparison
            if ((oldAcct.Priority__c != 'Highest' && oldAcct.Priority__c != 'High') && (updatedAcct.Priority__c == 'Highest' || updatedAcct.Priority__c == 'High')) {
                //we have a winner!  now check and see if the account has any Open Opportunities

                System.debug('Number of Opportunities on this Account' + acctsWithOpps.get(updatedAcct.Id).Opportunities.size());

                if (acctsWithOpps.get(updatedAcct.Id).Opportunities.size() == 0) {
                    //Ok, this account has no open opportunities, let's create one
                    Opportunity opp = new Opportunity();
                    opp.Name = updatedAcct.Name + ' Opportunity';
                    opp.StageName = 'Prospecting';
                    opp.CloseDate = Date.today().addMonths(3);
                    opp.AccountId = updatedAcct.Id;
                    newOpportunities.add(opp);
                }
            }
        }

        //Finally, insert any new Opportunities
        if (newOpportunities.size() > 0) {
            insert newOpportunities;
        }

    }

    public static void bulkificationExample(List<Account> accountList){
         //Week 8 Homework:  Properly bulkify this code:
         Id runningUserId = UserInfo.getUserId();

         for (Account a : accountList) {
             Case c = new Case();
             c.Status = 'New';
             c.Origin = 'New Account'; //Make sure you've added this as a picklist value for this field
             c.Subject = 'Send Welcome Package';
             c.AccountId = a.Id;
             c.Description = 'Please follow up with this new Account and send them a Welcome Package.';
 
             //Get the email address for the Account owner
             User u = [SELECT Id, Email FROM User WHERE Id = :runningUserId];
             c.Staff_Email_Address__c = u.Email;
             insert c;
         }
    }

}