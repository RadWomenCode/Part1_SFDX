public with sharing class WeekSixClassExercises {


    public static List<Account> getHotAccounts(Integer numberOfAccounts) {

        //In this piece of sample code, we want to return the number of Hot accounts requested.
        //This method takes one argument, an integer that tells us how many accounts to return
        //(This is a maximum.  IF we ask for 10, but there are only 2 Hot Accounts, you'll get 2 since we're limiting to 10)
        //An additional requirement is that we want to incude the Account Owner's email with the results

        List<Account> hotAccounts =
            [SELECT Id, Name, OwnerId, Priority__c, Owner.Email, AnnualRevenue FROM Account WHERE Rating = 'Hot' ORDER BY AnnualRevenue DESC LIMIT :numberOfAccounts];
        System.debug('How Many Hot accounts did we find? ' + hotAccounts.size());

        return hotAccounts;

    }

    public static void doStuffWithHotAccounts () {

        //Call our get Hot Accounts Method and do stuff
        getHotAccounts(2);

    }



    //This method returns a list of all the open opportunities there are for the top 5 accounts we have
    //It calls the getHotAccounts method we just reviewed
    public static List<Opportunity> getOpenOppsForHotAccounts() {

        //get the list of the top 5 hot accounts
        List<Account> hotAccounts = getHotAccounts(5);

        List<Opportunity> hotAccountsOpenOpps = [SELECT Id, Amount, StageName FROM Opportunity WHERE IsClosed = false AND AccountId in:hotAccounts];

        //Let's see those opportunities!
        System.debug('Our Hot Account Opportunities: ' + hotAccountsOpenOpps);


        return hotAccountsOpenOpps;

    }


    //Let's look at another way to loop through a list
    public static void loopingThroughLists() {
        //Let's get ourselves a list of open Opportunities.  10 Max

        List<Opportunity> tenOpenOpps = [SELECT Id, Name, Amount FROM Opportunity WHERE IsClosed = false LIMIT 10];

        //now you already know that we can loop through using this syntax:
        for (Opportunity o : tenOpenOpps) {
            System.debug('Opp in our loop Version 1: ' + o.Name);
        }

        //But we can also use the new syntax we just learned, using the size of the list to know how many loops we need.
        Integer listSize = tenOpenOpps.size();
        System.debug('*************************************************And Now for the same loop with different Syntax:');
        for (Integer i = 0; i < listSize; i++) {
            //Note that since we're usng this format, we use indexing to get values from each opportunity,
            //Using the tenOpenOpps list and the current value of i as the index
            System.debug('Opp in our loop Version 2: ' + tenOpenOpps[i].Name);
        }

        //Execute this method in Anonymous and you'll see that the loops are exactly the same.


    }


    //Let's look at the new For loop syntax we learned.  There are times when you might not know how many times you need to do something
    //in advance.  This is the perfect tool for those scenarios
    public static void createOppsForHotAccounts(Integer hotAccountLimit, Integer numberOfOpps) {
        System.debug('What is our limit of Hot Accounts to pull? ' + hotAccountLimit);
        System.debug('How many Opportunities should we create for each Account? ' + numberOfOpps);

        //Call the getHotAccounts method to get a list of the top accounts, passing the number of accounts desired to the method
        List<Account> hotAccounts = getHotAccounts(hotAccountLimit);

        //In this example we will create a number of opportunities for each top account.  However many we request when this method is
        //called.  A bit silly perhaps, but this should help illustrate the syntax

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