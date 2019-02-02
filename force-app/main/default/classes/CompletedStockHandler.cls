//A Utility class to process Stock Item records from the Stock Item Handler
public with sharing class CompletedStockHandler {

    //Default Constructor
    public CompletedStockHandler() {

    }

    public void onBeforeInsert(List<Stock_Item__c> newItems) {

        //If an item is being entered with a name that matches an existing item, it's a potential duplicate.  Update the name to indicate this

        //First create a list of the names in the incoming items
        List<String> itemNames = new List<String>();
        for (Stock_Item__c item : newItems) {
            itemNames.add(item.Item_Name__c);
        }

        //Query a list of any items already in the database with a name on the list
        List<Stock_Item__c> matchedExistingItems = [SELECT Id, Item_Name__c FROM Stock_Item__c WHERE Item_Name__c in:itemNames];

        //Check to see if there are any matches.  If so, we have some work to do
        if (matchedExistingItems.size() > 0) {

            //create a set of the names that matched for easy checking
            Set<String> matchedNames = new Set<String>();
            for (Stock_Item__c matchedItem : matchedExistingItems) {
                matchedNames.add(matchedItem.Item_Name__c);
            }

            //Now rename the any new items with a duplicate in the database
            for (Stock_Item__c item : newItems) {
                if (matchedNames.contains(item.Item_Name__c)) {
                    //Since this is a before trigger. No DML required.
                    item.Item_Name__c = item.Item_Name__c + ' Duplicate Item';
                }
            }

            ////Alternative/Bonus:  Thrown an exception Scenario
            //for (Stock_Item__c item: newItems) {
            //	if (matchedNames.contains(item.Item_Name__c)) {
            //		//Since this is a before trigger. No DML required.
            //		Throw new RadException('Duplicate Item!  Update the existing item or use a different Name.');
            //	}
            //}

        }

    }


    public void onBeforeDelete(List<Stock_Item__c> deletedItems) {

        //Before processing a delete, check if there is any stock on hand.  If there is, create a case.

        //list of cases to be inserted
        List<Case> casesToInsert = new List<Case>();

        for (Stock_Item__c item : deletedItems) {
            if (item.Stock_on_Hand__c > 0) {
                Case c = new Case();
                c.Status = 'New';
                c.Origin = 'User Generated'; //I added this as a picklist item, but you could use and existing Origin
                c.Subject = 'Item Deleted with Stock on Hand';
                c.Description = 'The item "' + item.Item_Name__c + '" with Id: ' + item.Id +
                    ' was deleted with a Stock on Hand of ' + item.Stock_on_Hand__c + '.  Please take any required Action.';
                casestoInsert.add(c);
            }
        }

        //Insert cases, if there are any
        if (casesToInsert.size() > 0) {
            insert casesToInsert;
        }

    }

    public static List<Stock_Item__c> getLowStockItems() {

        //Query for any items that have a stock on hand at or below their minimum stock level
        List<Stock_Item__c> lowStockItems = [SELECT Id, Item_Name__c, Item_Stock_is_Low__c, Minimum_Stock_Level__c, Stock_on_Hand__c
            FROM Stock_Item__c WHERE Item_Stock_is_Low__c = true];

        return lowStockItems;
    }

}