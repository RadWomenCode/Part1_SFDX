public with sharing class WeekFourClassExercises {

    public static void getHotAccounts() {
        //In this piece of sample code, we are printing the number of Hot accounts.
        //(This is a maximum.  IF we ask for 10, but there are only 2 Hot Accounts, you'll get 2 since we're limiting to 10)
        //An additional requirement is that we want to incude the Account Owner's email with the results
        List<Account> hotAccounts =
            [SELECT Id, Name, OwnerId, Priority__c, Owner.Email, AnnualRevenue FROM Account WHERE Rating = 'Hot' ORDER BY AnnualRevenue DESC LIMIT 10];
        System.debug('How Many Hot accounts did we find? ' + hotAccounts.size());
    }

    public static void getHotAccountsWithBindVariables() {
        //In this piece of sample code, we are introducing the concept of a bind variable. This method is identical to getHotAccounts()
        //except in this situation we are creating a variable called numberOfAccounts and adding that as a bind varible to our query. 
        //That means we can change the number of accounts displayed without changing any of the code in the method
        Integer numberOfAccounts = 10;
        List<Account> hotAccounts =
            [SELECT Id, Name, OwnerId, Priority__c, Owner.Email, AnnualRevenue FROM Account WHERE Rating = 'Hot' ORDER BY AnnualRevenue DESC LIMIT :numberOfAccounts];
        System.debug('How Many Hot accounts did we find? ' + hotAccounts.size());
    }

  
    //Let's look at the new For loop syntax we learned.  There are times when you might not know how many times you need to do something
    //in advance.  This is the perfect tool for those scenarios
    public static void forEachAccountsexample() {
        Integer numberOfOpps = 2;
        //Get all the HotAccounts using SOQL
        List<Account> hotAccounts =
            [SELECT Id, Name, OwnerId, Priority__c, Owner.Email, AnnualRevenue FROM Account WHERE Rating = 'Hot' ORDER BY AnnualRevenue DESC LIMIT 10];
        System.debug('How Many Hot accounts did we find? ' + hotAccounts.size());


        //List to hold the opportunities we're creating for later insertion
        List<Opportunity> oppsToInsert = new List<Opportunity>();

        //First we loop through the top accounts
        for (Account a : hotAccounts) {
            //now we need to create however many opportunities were passed in as an argument.  For that, we use an integer to keep track
            //of how many times we've looped through, stopping when we've done the loop the right number of times
            for (Integer i = 0; i < numberOfOpps; i++) {
                System.debug('What is the value of i at this moment?: ' + i);
                Opportunity opp = new Opportunity();
                opp.Name = 'Auto Generated Opportunity for Hot Accounts';
                opp.CloseDate = Date.today().addMonths(3);
                opp.AccountId = a.Id;
                opp.StageName = 'Prospecting';
                opp.OwnerId = a.OwnerId;
                oppsToInsert.add(opp);
            }
        }

        System.debug('How many Opportunities are we inserting? ' + oppsToInsert.size());
        insert oppsToInsert;

    }


}