public with sharing class WeekThreeHomework {


    public static void homeworkAssignmentMethod() {
        //Read through the setup below and then complete the code following the prompts.  When you're done, make sure to compile (save) your work
        //Open Execute Anonymous in the Developer Console and execute your code by typing in: WeekThreeHomework.homeworkAssignmentMethod();
        //Read through the debug statements to make sure you're done your work correctly.

        //************************************************************************************************************

        // 1. Add two more whole numbers to this list using .add()
        List<Integer> numberList = new List<Integer>{ 0, 1, 1, 2, 3, 5, 8, 13, 21, 34 };

        //Checking our work:
        System.debug('This number should be 12: ' + numberList.size());

        //************************************************************************************************************
        // 2. Create a new Lead and insert it in the database. (If you're stuck, look back at the WeekThreeClassExercises class for an example of creating a new SObject Record)
        //You can give it any values you like, but remember that last name and Company are required fields (both are simple text fields.)


        //Checking our work:
        System.debug('We should see One DML was executed: ' + Limits.getDMLRows());

    }

	public static void forLoopsExercise() {

		//1. Let's review iterating over a list of stuff.  How about Strings?

		List < String > myStringList = new List < String >{'red', 'yellow', 'green', 'blue'};

		// using for loop syntax, loop over the list of strings, printing each one out to the debug log.



		// 2. How about some SObjects?

		// I'll do the data setup here to create a list of contacts that all have a first name:
		Contact c1 = new Contact(FirstName='Sam');
		Contact c2 = new Contact(FirstName='Diane');
		Contact c3 = new Contact(FirstName='Coach');
		List < Contact > myContacts = new List < Contact >{c1,c2,c3};

		// Your turn!  Using a for loop, print out the first name of each contact on a different line
		//hint, you will need to use dot notation!





		//Bonus question to ponder: Do these contacts actually exist in our database?
		//What would it take to get them there?

	}
}