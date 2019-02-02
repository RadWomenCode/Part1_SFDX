public with sharing class WeekFourHomework {

    //Let's practice calling different methods by writing our very own methods. You will write and save methods in the space below
    //that call the existing methods you see already written here.  Ready?  Let's Go!


    //Sample: Here is a public method that calls the getfavoriteColorsMethod below and prints the results to our debug log
    public static void printOutFavoriteColorsDemo() {
        List<String> favoriteColors = getFavoriteColors();
        System.debug('Here are the favorite colors: ' + favoriteColors);
    }


    //1.  Write a public method that calls the getFavoriteColors method to get a list of favorite colors, then add
    //another color to the list before printing it to the debug log.
    //(see the sample above for an example of calling that method-You can even start by copying and pasting that method here, renaming and modifying it)


    //2.Write a public method that calls the amIFeelingGood and prints out the returned string to the debug log.
    //You'll need to pass in a boolean variable as the argument!


    //3.  BONUS!!  If you've finished the first two, there's another private method below that will return the top 10 Accounts
    //Write a public method that calls getTopTenAccounts.  Can you loop through those accounts and change the name of those accounts with a DML Update?


    //no arguments taken, will return the same thing every time
    private static List<String> getFavoriteColors() {
        List<String> colorResponses = new List<String>();

        colorResponses.add('Red');
        colorResponses.add('Yellow');
        colorResponses.add('Blue');

        //this is the line that sends our final product out to whatever method called this one
        return colorResponses;
    }


    //takes a boolean argument and returns a string, based on that input
    private static String amIFeelingGood(Boolean feelingGood) {
        if (feelingGood == true) {
            return 'Heck Yes!  You are RAD!';
        } else {
            return 'Sorry to hear it.  Nothing like writing some code to cheer you up!!';
        }
    }


    //This method will give you the top ten account records, based on Annual Revenue
    //You don't need to know exactly how the method you're calling works, we'll cover SOQL queries later, but take a look and you'll likely get the gist
    //What's important to know is that when called it will return a list of top Accounts based on revenue, returning no more than 10.
    private static List<Account> getTopTenAccounts() {

        List<Account> topAccounts =
            [SELECT Id, Name, AnnualRevenue FROM Account WHERE AnnualRevenue != NULL AND AnnualRevenue != 0
            ORDER BY AnnualRevenue DESC LIMIT 10];
        return topAccounts;
    }


}