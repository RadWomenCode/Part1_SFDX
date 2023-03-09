public with sharing class WeekFourHomework {

    public static void soqlPractice() {

        //1. Below is a SOQL query that should be returning the top 5 Accounts in our org based on Annual Revenue.
        //Something's not quite right, can you fix the query?
        List<Account> topFiveAccounts = [SELECT Id, Name, AnnualRevenue FROM Account WHERE AnnualRevenue != 0];

        System.debug('This should be 5  : ' + topFiveAccounts.size());


        //2. Here is a query that is missing something.  It compiles, but if you try and run this method in Anonymous
        //you'll get an error when the method tries to use the query results.  Fix it! :)

        List<Contact> contacts = [SELECT FirstName, MailingState FROM Contact LIMIT 10];

        for (Contact c : contacts) {
            String name = c.FirstName + ' ' + c.LastName;
        }


        //3.  Can you write a SOQL query from scratch that will return the top 10 Accounts in the org, ordered by annual
        //revenue in decending order?  Print your results in the debug log.


        

    }

    public static void forTheLoveOfForLoops() {

        //1. Take a look at the list and loop below.  It's commented out since it can't run as is.
        // Can you replace the ?? with the number that makes sense based on the comments?
        // Remove the slashes and compile.
        // Can you add an extra counter variable so that you can print out how many times the loop ran in total?


        //This loop should run 5 times
        //for (Integer i=0; i<??; i++) {
        //  System.debug('i is now: '+i);
        //}


        //2.  Below is a loop that iterates through a list.  Can you change it to use the traditional For Loop syntax?  It should print out
        //each account name in the debug log when you're done.
        //Use the list size to tell you how many loops, and use indexing to fetch values.  If you need help, check the
        //loopingThroughLists method from before weeks for hints

        List<Account> accountList = [SELECT Id, Name FROM Account LIMIT 5];

        for (Account a : accountList) {
            System.debug('Account Name: ' + a.name);
        }


    }

}