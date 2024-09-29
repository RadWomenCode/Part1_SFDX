trigger StockItemTrigger on Stock_Item__c (before insert, before delete) {

    //Before Insert Handling
    if(Trigger.isInsert && Trigger.isBefore) {
        //call the class in your handler for before insert
    }

    //Before Delete Handling
    if(Trigger.isDelete && Trigger.isBefore) {
        //call the class in your handler for before delete
    }


}