public with sharing class WeekThreeClassExercises {

    public static void sObjects() {

        /*  SObjects, sometimes written in camel case as sObjects, refers to the objects stored in Salesforce, including
            standard and custom objects.  Creating, fetching and editing object records allows you to interact with the records
            stored in your Salesforce instance */

        // Lets start by creating a new Account record
        Account a = new Account();

        //Let's use dot notation to assing some values to key fields
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

    public static void whileLoops() {

        //As you have read, a while loop allows you to execute the same code over and over while some condition is true.
        //Let's create a simple while loop that let's us add multiple account records to our datbase


        //First we need an integer variable which will be a counter that we use to keep track of our loops.  start it at 0
        Integer counter = 0;

        //we also need a list to put our new accounts in so that we can insert them via DML at the end
        List<Account> newAccounts = new List<Account>();  //Yep, you can have lists of SObjects just like primitives

        while (counter < 5) {
            //create an account, using the counter to give it a unique name for this execution
            System.debug('Counter Value before Incrementing ' + counter);

            Account a = new Account();
            a.Name = 'New Prospect ' + counter;
            a.Type = 'Prospect';
            newAccounts.add(a);  //we add our newly created account to the list we made above

            //increment our counter each time we go through the loop.  Without this we'd have an infinite loop!!!
            counter = counter + 1; //adds one to the current counter value
            System.debug('counter Value after incrementing ' + counter);
        }

        //Ok, when the loop is done, we can expect to have a list of 5 accounts, since we started the counter at 0
        // and incremented the counter each time and stopped once the counter was 5

        System.debug('Size of our Account List:' + newAccounts.size());

        //And finally we insert the whole list
        insert newAccounts;

        //All done!  You can search for and find these accounts in your salesforce org after running this method.

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


}