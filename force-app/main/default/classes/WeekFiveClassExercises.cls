public with sharing class WeekFiveClassExercises {

    //This simple method just returns whatever gets passed in.  Let's practice calling it from Execute anonymous
    public static String whatYouGiveIsWhatYouGet(string argumentBeingPassedIn) {
        return argumentBeingPassedIn;
    }

    //Fun, but usually we're passing an argument (aka parameter) into a method, so that it can do something with it.  and possibly return something

    //This public method takes a Date as an argument and returns the fiscal quarter as a String in the format: Q1, Q2 etc.
    public static String getFiscalQuarter(Integer numMonth) {
        String fiscalQuarter;
        if (numMonth >= 1 && numMonth <= 3) {
            fiscalQuarter = 'Q1';
        } else if (numMonth >= 4 && numMonth <= 6) {
            fiscalQuarter = 'Q2';
        } else if (numMonth >= 7 && numMonth <= 9) {
            fiscalQuarter = 'Q3';
        } else if (numMonth >= 10 && numMonth <= 12) {
            fiscalQuarter = 'Q4';
        } else {
            //The only way we end up here, is if this method was given an Integer that isn't a valid month,
            //like 13 or 99.  There are a lot of ways to handle these "exceptions" which we will cover in a future course.
            //For now we'll just return null, since there is no valid response
            return null;
        }

        return fiscalQuarter;
    }

    //Sometimes a method will take an argument, but return nothing.  That is what Void indicates below.  Nothing will be returned
    public static void insertNewAccount(String name) {
        Account a = new Account();
        a.Name = name;

        insert a;

        //that's all folks!  Nothing gets returned, we just created an account with the name provided.
    }


    //Private vs. Public.  We can call the public method, which calls the private, but we can't call the private directly

    public static String publicYouAreAwesome() {
        return privateYouAreAwesome();
    }


    private static String privateYouAreAwesome() {
        return 'You are Awesome!';

    }

    public static List<Account> getHotAccounts(Integer numberOfAccounts) {
        //In this piece of sample code, we are printing the number of Hot accounts based on input from user.
        //(This is a maximum.  IF we ask for 10, but there are only 2 Hot Accounts, you'll get 2 since we're limiting to 10)
        //An additional requirement is that we want to incude the Account Owner's email with the results
        List<Account> hotAccounts =
            [SELECT Id, Name, OwnerId, Priority__c, Owner.Email, AnnualRevenue FROM Account WHERE Rating = 'Hot' ORDER BY AnnualRevenue DESC LIMIT :numberOfAccounts];
        System.debug('How Many Hot accounts did we find? ' + hotAccounts.size());
        return hotAccounts;
    }
    
    //This method returns a list of all the open opportunities there are for the top 5 accounts we have
    //It calls the getHotAccounts method
    public static List<Opportunity> getOpenOppsForHotAccounts() {

        //get the list of the top 5 hot accounts
        List<Account> hotAccounts = getHotAccounts(5);

        List<Opportunity> hotAccountsOpenOpps = [SELECT Id, Amount, StageName FROM Opportunity WHERE IsClosed = false AND AccountId in:hotAccounts];

        //Let's see those opportunities!
        System.debug('Our Hot Account Opportunities: ' + hotAccountsOpenOpps);
        return hotAccountsOpenOpps;
    }

    
}