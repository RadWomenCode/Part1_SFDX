//Object Oriented Class that defines and provides functions for operating on an Item.
//This is sometimes called a Wrapper class, since it corresponds to an SObject in our Salesforce org.
public with sharing class Item {

    public Decimal listPrice; // ex  3.4 signifies $3.40
    public String name;
    public String description;
    public Integer minimumStockNeeded;

    //Constructor: Used when initializing the class, sets values for our Item object
    public Item(Decimal price, String itemName, String itemDescription, Integer minStock) {
        //set class variables
        listPrice = price;
        name = itemName;
        description = itemDescription;
        minimumStockNeeded = minStock;

    }

    //Inserts a corresponding Stock_Item__c object in our database
    public void insertItemSObject () {
        Stock_Item__c  stockItem = new Stock_Item__c();
        stockItem.Item_Name__c = this.name;
        stockItem.List_Price__c = this.listPrice;
        stockItem.Description__c = this.description;
        stockItem.Minimum_Stock_Level__c = this.minimumStockNeeded;

        insert stockItem;

    }

}