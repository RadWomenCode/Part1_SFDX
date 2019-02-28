trigger OpportunityTrigger on Opportunity (before insert) {

    //When an Opportunity is inserted, check and see if this account has a rating of 'Hot'.  If not, make it 'Hot'
    //since we consider any account with an open opportunity as hot

    //Get a map of account records that have opportunities in this trigger
    //In order to do this, we first need a set of the Account Ids
    Set<Id> accountIds = new Set<Id>();
    for (Opportunity opp : Trigger.new) {
        accountIds.add(opp.AccountId);
    }
    //Now we can get the map
    Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, Rating FROM Account WHERE Id IN :accountIds]);

    //Finally, a set to hold any accounts we're updating (we use a set, because it's possible to have multiple opportunities being
    //inserted for an account and they would then get added to the list twice.  We'll convert this set back to a list before doing DML )
    Set<Account> updatedAccountsSet = new Set<Account>();

    //ok, now we loop through and update as needed
    for (Opportunity opp : Trigger.new) {
        //get the account record for this opportunity
        Account acct = accountMap.get(opp.AccountId);
        if (acct.Rating != 'Hot') {
            acct.Rating = 'Hot';
            updatedAccountsSet.add(acct);
        }
    }

    if (updatedAccountsSet.size() > 0) {
        //convert the set to a list for DML
        List<Account> updatedAccounts = new List<Account>();
        //Add all the accounts from the set into our list
        updatedAccounts.addAll(updatedAccountsSet);
        update updatedAccounts;

    }

}