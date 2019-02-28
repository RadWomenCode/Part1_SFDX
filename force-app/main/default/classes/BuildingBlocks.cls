public with sharing class BuildingBlocks {
    //A demo class that demonstrates some basic building block of code

    // My new comment testing out VSCode

    public static void introToPrimitives() {
        //Primitives are the simplest elements in a programming language

        /* A selection of primitives in Apex:
        Integer: A number that does not have a decimal point, like 1 or 789 or -34
        Decimal: A number that includes a decimal point like 1.34 or 456.78907654
        String: Any set of characters surrounded by single quotes, like 'Apple' or 'I Love Strings' or '2 Legit 2 Quit'
        Boolean: A value that can only be true, false or null
        ID: Any valid 18 character Force.com ID (if you set an ID to the 15 digit value it automatically converts it to the 18 character version)

        Ok, there's more than those, and you can read all about it here: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_primitives.htm
        But that's enough to get us started.  Let's start by declaring some variables and initializing them with values

        //Wait, what do "Declare" and "Initialize" mean??  Let's explain by doing:
        */

        Integer i = 2; //Ok, so what we've done here is tell the computer that we are creating an instance of an integer
        //(Remember our list of primitives?  Variables have to be a type of Primitive.
        // We are going to call this instance (aka: variable) "i" and we're going to initialize (aka: assign) this variable with the value 2.
        //When people say Apex is strongly typed, they mean that we have to tell the computer exactly what kind of variable we're creating every time.

        //Let's make some more
        String mySampleString = 'This Awesome String is full of Stringy goodness';
        //ok, we told the computer that we are creating a variable that can hold any combination of characters.
        //Now we have a variable that is named mySampleString and which has stored the sentence you see above.

        //What if we declare a variable but don't initialize it with a value?
        Decimal dec;

        /*We can totally do that, but know that there is no value assigned yet and you'll need to make sure you assign a value later on
        in your code.  If you don't and you try to use the value of that variable later you'll get an error.
        let's give it a value so we don't get into trouble. */
        dec = 12.4;

        /* Hey, I didn't have to use the word Decimal this time.  Why?
        Since I declared the variable up on line 31 and named it dec, the computer now knows it's a decimal.  I don't have to tell it again*/

        //One more note on syntax: what's with all the semi-colons?
        // a ; is how you tell the computer that you're done with a line of code.  Get used to typing lots and lots of semi-colons!!

    }

    public static void primitivesExercise() {
        //You do this part!

        //1.  Declare three primitives variables, an Integer, a String and a Decimal

        //2.  Assign values to your three new variables

        //3.  Print out your variables to the debug log

        //4.  Declare an integer variable and assign a value in the same line

        //5.  Print out your integer to the debug log

    }

    public static void introToConditionals() {

        /*Comparison and logical operators are an important tool and one that we'll dive into much deeper with Conditional Statements next week.
        For now, let's just get familar with some of the syntax.*/

        //First, let's get some variables that we can work with
        //A single equals sign such as =, signals that we're assigning a value to a variable
        Integer i = 4;
        Integer j = 6;
        Integer k = 2;

        //Comparison operators let us do just that...Compare!
        //Let's declare a boolean variable to hold the result of our comparison
        Boolean isBigger;

        isBigger = i > k;  // the comparison operator here is the greater than symbol >
        //Ok, so what we just did is compare the values of i and k, which will have a true/false result and assigned it to the boolean variable isBigger
        //since i is in fact greater than k (4>2), the boolean value is true.  If you run this method in Execute anonymous you can see the result
        System.debug('isBigger: ' + isBigger);


        //We will use these more next week when we discuss if/then Conditional constructs and control statements.
        //You can find a complete list of operators here: https://developer.salesforce.com/docs/atlas.en-us.198.0.apexcode.meta/apexcode/langCon_apex_expressions_operators_understanding.htm?search_text=ternary

    }

    public static void conditionalsExercise() {

        Boolean result;

        // 1. Write a comparison statement that evaluates to false and assign the result to our result variable


        // 2. Declare another boolean variable and write a comparison that evaluates to true, assign it to your variable


    }

    public static void introToLists() {
        //As you know from your reading, lists are a collection of data of the same type (integers, strings, decimals etc.)
        //In Apex, a list can only contain data of the same type

        //Let's declare a list of strings
        List<String> listOfStrings = new List<String>();

        //great, we have a list declared, but we haven't yet put anything in it.  Before we do, let's look at another way to declare a list
        String[] anotherListOfStrings = new String[]{};
        //The above works just the same, it's simply a matter of preference.  You will see the first version syntax more freqently in examples and sample code

        //Lets add some values to our list using the .add() method.  Salesforce has a number of built-in methods that you can use on lists
        //including .add() and also .size() to get the size of a list.  You use .add() as shown below:
        anotherListOfStrings.add('Item1');
        anotherListOfStrings.add('Item2');
        anotherListOfStrings.add('Item3');

        //Now our list anotherListOfStrings has 3 items in it.  we can validate that using System.debug
        System.debug('size of anotherListOfStrings: ' + anotherListOfStrings.size()); //this will print out 3 in the debug log.
        //You can find all the built-in list methods here: https://developer.salesforce.com/docs/atlas.en-us.198.0.apexcode.meta/apexcode/apex_methods_system_list.htm#apex_System_List_methods


        //Can we declare a list and add values at the same time?  Of course!  Let's declare a list of integers and add 1, 2 & 3 to the list
        List<Integer> listOfIntegers = new List<Integer>{ 1, 2, 3 }; //Everything in the curly braces, separated by commas, is added to the list
        System.debug('Contents of listOfIntegers: ' + listOfIntegers);

        /*Let's talk about indexing.  Lists are ordered and you can refer to the entries in a list by using their index
        The first item in a list or other collection is in the 0th position, the next is in position 1, then 2 etc.
        Let's use a list of vegetables to demonstrate.
        */

        List<String> vegList = new List<String>{ 'celery', 'onions', 'carrots' };

        //Because celery is in the first position, it has an index of 0
        System.debug('Value of 0 Index:' + vegList[0]);

        /*if you open up the execute anonymous option in the developer console, and run this method by typing in: BuildingBlocks.introToLists();
        the debug log will show celery.  The syntax used to reference by index number is as you see above,
        the name of the lists followed by square brackets and the number of the position you want to reference
        */

        //Careful!  if you attempt to access a value that does not exist, you will get an error.
        //If we tried to access fruitList[5] for example, we would get an error, since there is no 6th value in the list.

    }

    public static void listsExercise() {
        //You do this part!

        //1.  Declare a list of Strings called myStringList

        //2.  Add three strings to your list and print it out in the debug log

        //3.  Print out the third value in your list of strings using list indexing.  (Hint:  see line 134)

        //4.  Declare a list of integers and add the values 1,2,3,4,5 all in one line  (meaning your code should be one line, not the resulting list)

    }

}