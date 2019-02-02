//Object Oriented Class that represents our Stock_Item__c Object and provides abstracted functionality 
public with sharing class StockItem {

    //class variables defined here
    public String sObjectID;
    public Decimal listPrice; // ex  3.4 signifies $3.40
    public String name;
    public String description;
    public Integer minimumStockNeeded;


    //First Constructor, allows you to instantiate a new StockItem based on required variables
    public StockItem(Decimal price, String itemName, String itemDescription, Integer minStock) {
        //set class variables
        this.listPrice = price;
        this.name = itemName;
        this.description = itemDescription;
        this.minimumStockNeeded = minStock;
    }

    //Second Constructor, allows you to instantiate a new StockItem based on an existing Stock_Item__c ID
    public StockItem(String sObjectID) {
        //Query for the existing Stock Item and instatiate a StockItem Wrapper Class
        Stock_Item__c stockItemSObject = [SELECT ID, Item_Name__c, List_Price__c, Description__c, Minimum_Stock_Level__c FROM Stock_Item__c WHERE ID=:sObjectID];

        this.sObjectID = stockItemSObject.ID;
        this.listPrice = stockItemSObject.List_Price__c;
        this.name = stockItemSObject.Item_Name__c;
        this.description = stockItemSObject.Description__c;
        this.minimumStockNeeded = Integer.valueOf(stockItemSObject.Minimum_Stock_Level__c);

    }

    //public methods
    public Boolean create() {

        //First, verify the StockItem does not already have an ID (it's not an existing record)
        if (String.isBlank(this.sObjectID)) {

            //verify that we have required fields
            if (this.allRequiredFieldsValid()) {
                Stock_Item__c newItem = new Stock_Item__c();
                newItem.Item_Name__c = this.name;
                newItem.List_Price__c = this.listPrice;
                newItem.Description__c = this.description;
                newItem.Minimum_Stock_Level__c = this.minimumStockNeeded;

                insert newItem;
                return true;

            } else {
                return false;
            }
            
        } else {
            return false;
        }

    }

    public Boolean updateValues() {
        //First, verify the StockItem has an SFID (it's and existing item that we can update)
        if (String.isNotBlank(this.sObjectID)) {

            //Validate all required fields
            if (this.allRequiredFieldsValid()) {
                Stock_Item__c updateItem = new Stock_Item__c(ID=this.sObjectID);
                updateItem.Item_Name__c = this.name;
                updateItem.List_Price__c = this.listPrice;
                updateItem.Description__c = this.description;
                updateItem.Minimum_Stock_Level__c = this.minimumStockNeeded;

                update updateItem;
                return true;

            } else {
                return false;
            }
            
        } else {
            return false;
        }
    }


    //Private Methods
    private Boolean allRequiredFieldsValid () {
        if (String.isNotBlank(this.name) && this.listPrice!=NULL && minimumStockNeeded!=NULL) {
            return true;
        } else {
            return false;
        }
    }

}