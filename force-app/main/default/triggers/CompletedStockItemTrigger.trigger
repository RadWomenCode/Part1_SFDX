trigger CompletedStockItemTrigger on Stock_Item__c (before insert, before delete) {

    //Instantiate StockItemHandler
    StockItemHandler handler = new StockItemHandler();

    ////Before Insert Handling
    //if(Trigger.isInsert && Trigger.isBefore) {
    //    handler.OnBeforeInsert(Trigger.new);
    //}

    ////Before Delete Handling
    //if(Trigger.isDelete && Trigger.isBefore) {
    //    handler.OnBeforeDelete(Trigger.old);
    //}


}