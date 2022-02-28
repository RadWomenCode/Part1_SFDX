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

    
}