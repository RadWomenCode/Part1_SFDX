public with sharing class WeekOneHomework {
    
	public static void introToPrimitives() {

        //Primitives are the simplest elements in a programming language

        /* A selection of primitives in Apex:
        Integer: A number that does not have a decimal point, like 1 or 789 or -34
        Decimal: A number that includes a decimal point like 1.34 or 456.78907654
        String: Any set of characters surrounded by single quotes, like 'Apple' or 'I Love Strings' or '2 Legit 2 Quit'
        Boolean: A value that can only be true, false or null
        Id: Any valid 18 character Force.com Id (if you set an Id to the 15 digit value it automatically converts it to the 18 character version)

        Ok, there's more than those, and you can read all about it here: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_primitives.htm
        But that's enough to get us started.  Let's start by declaring some variables and initializing them with values

        //Wait, what do "Declare" and "Initialize" mean??  Let's explain by doing:
        */

        Integer i = 2; //Ok, so what we've done here is tell the computer that we are creating an instance of an integer
        //(Remember our list of primitives?  Variables have to be a type of primitive.
        // We are going to call this instance (aka: variable) "i" and we're going to initialize (aka: assign) this variable with the value 2.
        //When people say Apex is strongly typed, they mean that we have to tell the computer exactly what kind of variable we're creating every time.

        //Let's make some more
        String mySampleString = 'This Awesome String is full of Stringy goodness';
        //ok, we told the computer that we are creating a variable that can hold any combination of characters.
        //Now we have a variable that is named mySampleString and which has stored the sentence you see above.

        //What if we declare a variable but don't initialize it with a value?
        Decimal dec;

        /*We can totally do that, but that there is no value assigned yet and you'll need to make sure you assign a value later on
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

}
