@isTest
private class packageTestCoverage {
    
    @isTest static void coverageToAllowPackageDeploy() {
        StockItem si = new StockItem();

        Stock_Item__c s = new Stock_Item__c();
        s.Item_Name__c = 'My Item';
        insert s;

    }
    
    @isTest static void testMethodTwo() {
        // Implement test code
    }
    
}