public with sharing class WeekOneClassExercises {
    
	public static void talkingAboutPrimitives() {
        //Lets declare some primitives!
        Integer int1;
        Boolean bool1;

        //What are some other types we can declare?
        String str1;
        Decimal dec1;

        //Assigning Values
        int1 = 2;
        bool1 = false;
        str1 = 'Mr. Stringy';
        dec1 = 3.14;

        //More commonly you can declare a variable and assign it a value in the same operation
        Integer int2 = 3;
        Boolean bool2 = true;
        String str2 = 'Ms. String';
        Decimal dec2 = 1.99;

        //Using some of those values
        Integer result = int1 + int2;  //Since we assigned int1 a value of 2 and int2 a value of 3, result is now equal to 5

    }
}