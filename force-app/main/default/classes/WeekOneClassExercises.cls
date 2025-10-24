public with sharing class WeekOneClassExercises {
    
    public static void talkingAboutPrimitives() {
        // Lets declare some primitives!
        Integer quantity;
        Boolean isAvailable;
        
        // What are some other types we can declare?
        String productName;
        Decimal unitPrice;

        // Assigning values
        quantity = 2;
        isAvailable = false;
        productName = 'Stanley Cup';
        unitPrice = 3.14;

        // You can also declare and assign in a single line
        Integer additionalQuantity = 3;
        Boolean isOnSale = true;
        String customerName = 'Alice';
        Decimal discountAmount = 1.99;

        // Using some of those values
        Integer totalQuantity = quantity + additionalQuantity;  
        // quantity = 2 and additionalQuantity = 3, so totalQuantity = 5

        // A more complete example: calculating total cost
        Decimal totalCost = (unitPrice - discountAmount) * totalQuantity;

        System.debug('Total cost for ' + customerName + ' = ' + totalCost);
    }
}
