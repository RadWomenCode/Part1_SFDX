/**
 * Object Oriented Class that represents our Stock_Item__c Object and provides functionality 
 */
public with sharing class CompletedStockItem {

    public String id;
    public String name;
    public String description;
    public Decimal listPrice;
    public Integer minStockLevel;
    public Integer stockOnHand;

    /**
     * Class constructor.
     */
    public CompletedStockItem(String itemName, String itemDescription, Decimal itemPrice, Integer itemMinStock, Integer itemStockOnHand) {
        name = itemName;
        description = itemDescription;
        listPrice = itemPrice;
        minStockLevel = itemMinStock;
        stockOnHand = itemStockOnHand;
    }

    public void create () {

        Stock_Item__c item = new Stock_Item__c ();
        item.Item_Name__c = name;
        item.Description__c = description;
        item.List_Price__c = listPrice;
        item.Minimum_Stock_Level__c = minStockLevel;
        item.Stock_on_Hand__c = stockOnHand;
        insert item;

    }

}