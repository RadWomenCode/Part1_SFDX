public with sharing class WeekThreeClassExercises {

    public static void sObjects() {

        /*  SObjects, sometimes written in camel case as sObjects, refers to the objects stored in Salesforce, including
            standard and custom objects.  Creating, fetching and editing object records allows you to interact with the records
            stored in your Salesforce instance */

        // Lets start by creating a new Account record
        Account a = new Account();

        //Let's use dot notation to assign some values to key fields
        a.Name = 'Pok Pok';  //a famous Portland restaurant! :)
        a.BillingCity = 'Portland';
        a.BillingState = 'OR';
        a.Type = 'Customer - Direct';
        a.Cuisine_Type__c = 'Thai Street Food';  //note the syntax for referring to a custom field

        //Ok great, we have a new account record, but how do we get it in the Database?  We need DML!
        insert a;

        //Other DML commands include update, delete and upsert

        //when we run this code, the new account will be saved to our database.

        //If you have left off required fields, or cause any other error, the record will not be saved and you will see an error

    }



    public static void conditionals() {
        //continuing on from last week, conditional statements, or control statements, utilize the comparison and logical operators
        //we have explored and combined them with the if/then/else construct to control when and how code is executed.

        //Let's look at a conditional statement
        //First, declare some variables and assign values
        Decimal minimumPurchaseValue = 5.0;  //This is a variable that stores the minimum purchase value needed to complete an order
        Decimal itemAValue = 2.50;  //We'll create some variables that store the amounts of different items
        Decimal itemBValue = 1.50;
        Decimal itemCValue = 3;

        //At first, the cart just has items A & B in it
        Decimal currentCartValue = itemAValue + itemBValue;
        System.debug('How much is in the cart now? ' + currentCartValue);

        //Let's see if our customer can check out yet
        Boolean canCheckOut; //This is a boolean to store whether or not they have enough in their cart to check out

        if (currentCartValue >= minimumPurchaseValue) {
            canCheckOut = true;
        } else {
            canCheckOut = false;
        }
        //when you run this code, you will see the following debugging statement in the console
        System.debug('CanCheckOut after Items A & B :' + canCheckOut);

        //Ok, looks like we don't have enough yet, but what if the customer adds item c?
        currentCartValue += itemCValue;
        System.debug('After adding itemC, how much is in the cart? ' + currentCartValue);

        if (currentCartValue >= minimumPurchaseValue) {
            canCheckOut = true;
        } else {
            canCheckOut = false;
        }

        System.debug('CanCheckOut after Items A & B &C :' + canCheckOut);

        //Let's execute this code and look at the debugging statements from above

    }

	//Let's look at another way to loop through a list
    public static void loopingThroughLists() {
        //Let's get ourselves a list of open Opportunities.  10 Max

		// This is a SOQL query to recieve records from Salesforce.  We'll be covering these soon!!
        List<Opportunity> tenOpenOpps = [SELECT Id, Name, Amount FROM Opportunity WHERE IsClosed = false LIMIT 10];

        //Let's look at how we can iterate, or loop through this list and inspect or interact with each of the opportunities
        for (Opportunity o : tenOpenOpps) {
            System.debug('Opp in our loop : ' + o.Name);
        }

    }


}