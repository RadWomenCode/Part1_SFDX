public with sharing class WeekFiveHomework {
    
	//Let's practice calling different methods by writing our very own methods. You will write and save methods in the space below
    //that call the existing methods you see already written here.  Ready?  Let's Go!


    //Sample: Here is a public method that calls the getCitiesForExpansion below and prints the results to our debug log
    public static void printOutCitiesForExpansionDemo() {
        //The code on the left of the equals sign instantiates a list of Strings, the code on the right side calls our method and returns a list of cities
        //the equals sign assigns the returned value, to the list we created
        List<String> cities = getCitiesForExpansion();
        System.debug('Here are the cities: ' + cities);
    }


    //1.  Write a public method that calls the getCitiesForExpansion method to get a list of cities, then add
    //another city to the list before printing it to the debug log.
    //(see the sample above for an example of calling that method-You can even start by copying and pasting that method here, renaming and modifying it)


    //2.Write a public method that calls the isTopSalesCity method and prints out the returned boolean to the debug log.
    //You'll need to pass in a string variable that is a city name as the argument!


    //3.  BONUS!!  If you've finished the first two, there's another public method below that will return the top 10 Accounts
    //Write a public method that calls getTopTenAccounts.  Can you loop through those accounts and change the name of those accounts with a DML Update?


    //no arguments taken, will return the same thing every time
    public static List<String> getCitiesForExpansion() {
        List<String> cities = new List<String>();

        cities.add('Tokyo');
        cities.add('Melbourne');
        cities.add('Portland');

        //this is the line that sends our final product out to whatever method called this one
        return cities;
    }


    //takes a string argument and returns a boolean, based on that input
    public static Boolean isTopSalesCity (String cityName) {
        if (cityName=='Seattle' || cityName=='Los Angeles' || cityName=='Portland') {
            return true;
        } else {
            return false;
        }
    }


    //This method will give you the top ten account records, based on Annual Revenue
    //You don't need to know exactly how the method you're calling works, we'll cover SOQL queries later, but take a look and you'll likely get the gist
    //What's important to know is that when called it will return a list of top Accounts based on revenue, returning no more than 10.
    public static List<Account> getTopTenAccounts() {

        List<Account> topAccounts =
            [SELECT Id, Name, AnnualRevenue FROM Account WHERE AnnualRevenue != NULL AND AnnualRevenue != 0
            ORDER BY AnnualRevenue DESC LIMIT 10];
        return topAccounts;
    }



}