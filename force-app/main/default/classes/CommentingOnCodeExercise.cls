public with sharing class CommentingOnCodeExercise {

    //Your Assignment is to add comments describing what is being done in the methods below.
    //Call out the concepts you learned in your readings and in class.

    public static void cartValues() {

        Integer minimumCartValue = 50;

        Integer itemA = 10;
        Integer itemB = 20;
        Integer itemC = 45;

        Integer cartValue = itemA + itemB;

        Boolean cartMinimumMet = cartValue >= minimumCartValue;

        System.debug('Have we reached the minimum: ' + cartMinimumMet);

        cartValue = cartValue + itemC;

        cartMinimumMet = cartValue >= minimumCartValue;

        System.debug('How about now? : ' + cartMinimumMet);

    }


}