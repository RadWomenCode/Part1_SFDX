public with sharing class WeekThreeHomework {


    public static void homeworkAssignmentMethod() {
        //Read through the set-up below and then complete the code following the prompts.  When you're done, make sure to compile (save) your work
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


        //************************************************************************************************************
        //3. For the loop that is commented out below, update the while condition by replacing the ?? so that the loop runs 5 times
        //delete the slashes so that the loop is no longer commented out and compile the class.

        //Can you add a debug statement to print out the counter value every time it runs through the loop?


        Integer counter = 0;

        //while (counter < ??) {
        counter++;  //without this line to increment counter, we'd have an infinite loop!
        //}

        System.debug('Done with the loop, it ran: ' + counter + ' times.');

    }
}