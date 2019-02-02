public with sharing class WeekTwoClassExercises {
    //Another demo class that we will use to work through new concepts in-Class

    public static void talkingAboutPrimitives() {
        //Lets declare some primitives!
        Integer i;

        //What are some other types we can declare?
        String s;
        Decimal d;

        //Assigning Values
        i = 2;
        s = 'Mr. Stringy';

        //More commonly you can declare a variable and assign it a value in the same operation
        Integer j = 3;
        String str = 'Ms. String';
        Decimal dec = 3.14;

        //Using some of those values
        Integer result = i + j;  //Since we assigned i a value of 2 and j a value of 3, result is now equal to 5

    }


    public static void comparisonAndLogicalOperators() {
        //Conditionals and logical operators are an important part of coding.  You may already be familiar with them in concept from formula fields and other
        //declarative tools in Salesforce that use conditional logic.

        /*Comparison operators to be familiar with are
        == Two equals signs indicate you are comparing two values to see if they are the same
        < less than
        <= less than or equal to
        >= greater than or equal to
        != not equal (evaluates whether the two values are NOT Equal)

        //Logical Operators allow you to build out the logic of complex comparisons
        && signifies AND
        || signifies OR

        */

        Boolean isGreater = 4 > 6;  // Our isGreater variable must be false, since 4 is not greater than 6

        Boolean isLess = 4 > 2;  //our isLess must be true, since 4 IS greater than 2

        Boolean areEquivilant = (5 == 2 + 3);  //areEquivilant must be true, since 5 is equivilant to 2+3.  The parenthesis here aren't necessary, but do make the code more readable
        //note that the single equals sign above is to assign a value to our boolean variable, whereas the double equals sign is a comparison operator

        Boolean result = (5 > 2 && (10 == 5 * 2)); //result must be true since 5 is greater than 2 AND 10 is equivilant to 5 times 2

        Boolean anotherResult = 2 != 3;  //again, true since 2 does not equal 3

        //Hopefully this gave you a quick look at the syntax


    }

    public static void introToLists() {

        //Let's declare and initalize a list of strings
        List<String> listOfStrings = new List<String>();

        //Ok, we have a list declared, but we haven't yet put anything in it. let's put some stuff in those lists
        listOfStrings.add('EntryA');
        listOfStrings.add('EntryB');
        listOfStrings.add('EntryC');

        //Great, now listOfStrings has three strings in it. Let's prove it by printing out the list size using System.debug
        System.debug('Size of listOfStrings: ' + listOfStrings.size());

        //What's this whole .size() business?  Part of the Apex language is the built-in methods provided.  We'll talk
        //more about what methods are later, but for now, know that they are bits of funtionality you can use to do
        //fun stuff like get the size of a list

        //Let's declare a list and add values all in the same line
        List<Integer> listOfIntegers = new List<Integer>{ 1, 2, 3 };

        //And to see the values in the debug log:
        System.debug('Contents of listOfIntegers: ' + listOfIntegers);

        //Same idea with a list of strings
        List<String> fruitList = new List<String>{
            'apples', 'pears', 'oranges', 'pineapples'
        };
        System.debug('Contents of fruitList ' + fruitList);

        //As we saw in our reading, you can refer to the value of an item in a list by using its index, or the order in which it appears in the list
        System.debug('Value of 0 Index:' + fruitList[0]);

        //Let's do one together!  Using System.debug, print out the value oranges


    }

    public static void letsTalkAboutIndents() {
        //As you look through the sample code in this org, and other places, you'll probably notice it looks pretty tidy
        //That is the magic of indenting.  Through simply keeping logical groupings indented the same number of spaces
        //and then indenting sub-sections further, you always know what section you're in

        //Take a look at different classes in the sample code for this org, and even if you're not quite sure what it's doing yet
        //you should see that the indenting makes logical groupings easier.
    }

}