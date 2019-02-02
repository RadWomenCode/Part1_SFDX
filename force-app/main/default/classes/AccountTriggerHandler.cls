//A Utility class to process Account records from the AccountTrigger
public with sharing class AccountTriggerHandler {


	//Deprecating

	////class variable, set when the class is instantiated.
	//private integer BatchSize = 0;
	
	////Class Constructor
	//public AccountTriggerHandler(integer size){
	//	//Since Trigger context variables are not available in the handler class, you must pass those variables from the trigger into
	//	//the handler if you wish to reference them.  This example requires you to pass in the Trigger.size variable from the Trigger to the handler so 
	//	//when you instantiate it so that we can reference it in our processing.  	
	//	BatchSize = size;
	//}

	
	//public void OnBeforeInsert(List < Account > newAccounts){
	//	//Set the priority based on Annual Sales
	//	for (Account a: newAccounts) {
	//		if (a.Est_Annual_Sales__c >= 5000000) {
	//			a.Priority__c = 'Highest';
	//		} else if (a.Est_Annual_Sales__c >= 3000000) {
	//			a.Priority__c = 'High';
	//		} else if (a.Est_Annual_Sales__c >= 1000000) {
	//			a.Priority__c = 'Standard';
	//		} else {
	//			a.Priority__c = 'Low';
	//		}
	//	}
	//	//No DML needed when updated trigger records in a before context

	//}
	
	////After inserting new Accounts we want to Create a new case for the account assigning someone to follow up
	////We also need to pull the email from the account owner's user record and put it on the case record 
	//public void OnAfterInsert(List < Account > newAccounts){
	//	//Week 6 Homework:  Properly bulkify this code:
	//	for (Account a: newAccounts) {
	//		Case c = new Case();
	//		c.Status = 'New';
	//		c.Origin = 'New Account'; //Make sure you've added this as a picklist value for this field
	//		c.Subject = 'Send Welcome Package';
	//		c.AccountId = a.id;
	//		c.Description = 'Please follow up with this new Account and send them a Welcome Package.';
	//		//Get the email address for the Account owner
	//		User u = [SELECT ID, Email FROM User WHERE ID=:a.OwnerId];
	//		c.Staff_Email_Address__c = u.Email;
	//		insert c;
	//	}

	//}
	
	//public void OnBeforeUpdate(List < Account > oldAccounts, List < Account > updatedAccounts, Map<ID, Account> updatedAccountMap, Map<ID, Account> oldAccountMap){

	//}
	
	////When an account is updated to move from a low or standard priority to high or highest, 
	////If there is no open opportunity for that account, create one.
	//public void OnAfterUpdate(List < Account > oldAccounts, List < Account > updatedAccounts, Map<ID, Account> updatedAccountMap, Map<ID, Account> oldAccountMap){
	//	//First thing we do is query for all the opportunities on accounts in this trigger
	//	//The SOQL query below uses a nested query, this let's us pull back each acccount with a list of its opportunities attached.
	//	//We won't be covering nested queries in this class, but take a look and see if you can figure out how they work
	//	Map < Id, Account > acctsWithOpps = new Map < Id, Account > ([SELECT Id,(SELECT Id FROM Opportunities WHERE isClosed = FALSE) FROM Account WHERE Id IN :updatedAccounts]);

	//	//Let's make a list to hold any opportunities we create for later insertion
	//	List < Opportunity > newOpportunities = new List < Opportunity >();

	//	//Now we need to loop through the accounts in this trigger and see if their priority has been changed in the way we're looking for
	//	for (Account updatedAcct: updatedAccounts) {
	//		//ok, so now we have the udpated Account record, but we also need to compare it to the old version to see what has changed
	//		//We can use the oldAccountMap, pass it the Account ID, and we'll get the old version for comparison 
	//		Account oldAcct = oldAccountMap.get(updatedAcct.id);
	//		//ok, now we have the new and old versions of the same record and we can make our comparison
	//		if ((oldAcct.Priority__c != 'Highest' && oldAcct.Priority__c != 'High') && (updatedAcct.Priority__c == 'Highest' || updatedAcct.Priority__c == 'High')) {
	//			//we have a winner!  now check and see if the account has any Open Opportunities
	//			System.debug('Number of Opportunities on this Account' + acctsWithOpps.get(updatedAcct.Id).Opportunities.size());
	//			if (acctsWithOpps.get(updatedAcct.Id).Opportunities.size() == 0) {
	//				//Ok, this account has no open opportunities, let's create one
	//				Opportunity opp = new Opportunity();
	//				opp.Name = updatedAcct.Name + ' Opportunity';
	//				opp.StageName = 'Prospecting';
	//				opp.CloseDate = Date.today().addMonths(3);
	//				opp.AccountId = updatedAcct.id;
	//				newOpportunities.add(opp);
	//			}

	//		}
	//	}

	//	//Finally, insert any new Opportunities
	//	if (newOpportunities.size()>0) {
	//		insert newOpportunities;
	//	}
	//}
	
	//public void OnBeforeDelete(List < Account > accountsToDelete, Map<ID, Account> deletedAccountMap){
		
	//}
	
	//public void OnAfterDelete(List < Account > deletedAccounts, Map<ID, Account> deletedAccountMap){
		
	//}
	
	//public void OnUndelete(List < Account > restoredAccounts){
		
	//}

}