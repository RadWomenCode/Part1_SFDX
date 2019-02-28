//We're calling this 'BadAccountTrigger' because this trigger has business logic directly coded in the trigger file. It's also using
//way more parameters (on line 6) than it actually uses in the trigger itself. Both of these are considered bad practice. 
//Business logic coded directly in a trigger and having extra stuff in your code both make the code hard to read and hard to maintain.  
//The 'GoodAccountTrigger' shows how to use a handler class with your trigger and is much simpler to read. 
//For more information on trigger syntax: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_triggers_syntax.htm

trigger AccountTriggerBad on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

    //Each section of code below handles a different event & timing combination.  For now, we are demonstrating a trigger that has all of the logic right here.
    //Later on we'll be looking at other ways of handling Trigger events using handler classes, but for now, we want to keep all the logic in once place as
    //we're learning.

    //Before an account record is inserted, we want to classify them according to estimated annual sales
    if (Trigger.isInsert && Trigger.isBefore) {

        for (Account a : Trigger.new) {
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
        //No DML needed here, since it's a BEFORE insert trigger
    }
    //After an Account is inserted, we want to create a case that prompts a user to send out a welcome package.
    //We also need to pull the email from the account owner's user record and put it on the case record
    //(hint, the account owner will be the running user, in this use case, and our code has already fetched that id for us below:
    else if (Trigger.isInsert && Trigger.isAfter) {
        //Week 7 Homework:  Properly bulkify this code:
        Id runningUserId = UserInfo.getUserId();

        for (Account a : Trigger.new) {
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
    } else if (Trigger.isUpdate && Trigger.isBefore) {
        //no action needed on Before Update
    }

    //After an Account is Updated, if it is moving from a low or standard priority to high or highest,
    //and there is no open opportunity for that account, create one.
    else if (Trigger.isUpdate && Trigger.isAfter) {

        //First thing we do is query for all the opportunities on accounts in this trigger
        //The SOQL query below uses a nested query, this let's us pull back each acccount with a list of its opportunities attached.
        //We won't be covering nested queries in this class, but take a look and see if you can figure out how they work
        Map<Id, Account> acctsWithOpps = new Map<Id, Account>(
            [SELECT Id, (SELECT Id FROM Opportunities WHERE IsClosed = false) FROM Account WHERE Id IN :Trigger.new]
        );

        //Let's make a list to hold any opportunities we create for later insertion
        List<Opportunity> newOpportunities = new List<Opportunity>();

        //Now we need to loop through the accounts in this trigger and see if their priority has been changed in the way we're looking for
        for (Account updatedAcct : Trigger.new) {

            //ok, so now we have the udpated Account record, but we also need to compare it to the old version to see what has changed
            //We can use the oldAccountMap, pass it the Account Id, and we'll get the old version for comparison
            Account oldAcct = Trigger.oldMap.get(updatedAcct.Id);

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

    } else if (Trigger.isDelete && Trigger.isBefore) {
        //no action needed on Before Delete
    } else if (Trigger.isDelete && Trigger.isAfter) {
        //no action needed on After Delete
    } else if (Trigger.isUndelete) {
        //no action needed on Undelete
    }
}