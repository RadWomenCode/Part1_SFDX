@isTest
private class StockItemHandler_Test {
    
    @isTest static void testBeforeInsertFunctionality() {
        // Implement test code
    }
    
    @isTest static void testBeforeDeleteFunctionality() {
        // Implement test code
    }

    @isTest static void testGetLowStockItems() {
        // Implement test code
    }

    @isTest static void packageUploadCoverage() {
        Stock_Item__c item = new Stock_Item__c();
        item.Item_Name__c = 'Test';
        item.Description__c = 'Test';
        item.Minimum_Stock_Level__c =3;

        insert item;

    }
    
}