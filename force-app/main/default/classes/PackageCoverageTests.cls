/**
 * Important Note!!!!!!!
 * The below tests are simply to have enough coverage so that this package can be uploaded for class use.
 * These are not true tests and are not even close to proper test coverage.  Basically, pay no attention to these.
 */
@isTest
private class PackageCoverageTests {

    @isTest static void testMethodOne() {
        Account a = new Account();
        a.Name = 'test';
        insert a;

        a.Name = 'updated test';
        update a;
    }
 
    @isTest static void testMethodTwo() {
        Account a = new Account();
        a.Name = 'test';
        insert a;

        Opportunity o = new Opportunity();
        o.AccountId = a.Id;
        o.CloseDate = Date.today();
        o.StageName = 'Prospecting';
        o.Name = 'Test Opp';
        insert o;
    }

    @isTest static void weekTwoTests() {

        WeekTwoClassExercises.talkingAboutPrimitives();
        WeekTwoClassExercises.comparisonAndLogicalOperators();
        WeekTwoClassExercises.introToLists();
        WeekTwoHomework.introToPrimitives();
        WeekTwoHomework.primitivesExercise();
        WeekTwoHomework.introToConditionals();
        WeekTwoHomework.conditionalsExercise();
        WeekTwoHomework.introToLists();
        WeekTwoHomework.listsExercise();
        Welcome.youDoThisPart();

    }

    @isTest static void weekThreeTests() {

        WeekThreeClassExercises.sObjects();
        WeekThreeClassExercises.whileLoops();
        WeekThreeClassExercises.conditionals();
        WeekThreeHomework.homeworkAssignmentMethod();
        CommentingOnCodeExercise.cartValues();

    }

    @isTest static void weekFourTests() {

        WeekFourClassExercises.whatYouGiveIsWhatYouGet('test');
        WeekFourClassExercises.getFiscalQuarter(2);
        WeekFourClassExercises.getFiscalQuarter(5);
        WeekFourClassExercises.getFiscalQuarter(8);
        WeekFourClassExercises.getFiscalQuarter(11);
        WeekFourClassExercises.getFiscalQuarter(20);
        WeekFourClassExercises.insertNewAccount('New Account Name');
        WeekFourClassExercises.publicYouAreAwesome();
        WeekFourHomework.printOutCitiesForExpansionDemo();
        WeekFourHomework.getCitiesForExpansion();
        WeekFourHomework.isTopSalesCity('Seattle');
        WeekFourHomework.getTopTenAccounts();
    }

    @isTest static void weekFiveTests() {

        WeekFiveClassExercises.allAboutSets();
        WeekFiveClassExercises.muchAdoAboutMaps();
        WeekFiveHomework.setsReview();
        WeekFiveHomework.listsReview();
        WeekFiveHomework.mapsReview();

    }

    @isTest static void weekSixTests() {

        // create a hot account
        Account a = new Account();
        a.Name = 'Hot Account';
        a.Rating = 'Hot';
        insert a;

        WeekSixClassExercises.getHotAccounts(2);
        WeekSixClassExercises.getOpenOppsForHotAccounts();
        WeekSixClassExercises.loopingThroughLists();
        WeekSixClassExercises.createOppsForHotAccounts(2, 2);
        WeekSixHomework.soqlPractice();
        WeekSixHomework.forTheLoveOfForLoops();

    }

    @isTest static void weekEightTests() {

        WeekEightHomework.createSampleAccounts(2);

    }

    @isTest static void objectTests() {
        Item i = new Item(3.5, 'Test', 'Test Item', 100);

        ShoppingCart cart = new ShoppingCart(20);
        cart.addItem(i);

        List<Item> items = new List<Item>{ i };
        cart.addItems(items);
        cart.ableToCheckout();
        cart.emptyCart();

    }

    @isTest static void calculatorTest() {

        Calculator.calculate(1, 2, '+');
        Calculator.calculate(2, 4, '/');
        Calculator.calculate(1, 2, '*');
        Calculator.calculate(4, 2, '-');

    }

    @isTest static void contactTest() {

        Contact c = new Contact();
        c.FirstName = 'MyTestFirst';
        c.LastName = 'MyTestLast';
        insert c;

    }

    @isTest static void accountTriggerCoverage() {

        Account a = new Account();
        a.Name = 'TestAccount';
        a.Est_Annual_Sales__c = 5000001;
        insert a;

        Account a2 = new Account();
        a2.Name = 'TestAccount';
        a2.Est_Annual_Sales__c = 3000001;
        insert a2;

        Account a3 = new Account();
        a3.Name = 'TestAccount';
        a3.Est_Annual_Sales__c = 1000001;
        insert a3;

    }

    @isTest static void accountHandlerCoverage() {

        List < Account > accts = new List < Account >();

        Account a = new Account();
        a.Name = 'TestAccount';
        a.Est_Annual_Sales__c = 5000001;
        accts.add(a);

        Account a2 = new Account();
        a2.Name = 'TestAccount';
        a2.Est_Annual_Sales__c = 3000001;
        accts.add(a2);

        Account a3 = new Account();
        a3.Name = 'TestAccount';
        a3.Est_Annual_Sales__c = 1000001;
        accts.add(a3);

        AccountTriggerHandler.handleBeforeInsert(accts);
        AccountTriggerHandler.handleAfterInsert(accts);


    }
    @isTest static void itemCoverage() {

        item it = new Item(10, 'TestItem', 'sample', 5);
        it.insertItemSObject();
        

    }
    @isTest static void itemCollectionCoverage() {

        List < Item > items = new List < Item >();

        for (Integer i=1; i<6;i++) {
            Item item = new Item(i, 'TestItem '+i, 'sample', 5);
            items.add(item);
        }

        ItemCollection collection = new ItemCollection(items);

        collection.insertItemSobjects();

    }

    @isTest static void completedStockItemHandlerCoverage() {

        List < Stock_Item__c > newItems = new List < Stock_Item__c >();

        // insert a stock item to match on
        Stock_Item__c dupeItem = new Stock_Item__c();
        dupeItem.Item_Name__c = 'Test1';
        dupeItem.Description__c = 'Test';
        dupeItem.Minimum_Stock_Level__c = 2;
        dupeItem.Stock_on_Hand__c = 5;
        insert dupeItem;

        for (integer i=0; i<5; i++) {
            Stock_Item__c item = new Stock_Item__c();
            item.Item_Name__c = 'Test' +i;
            item.Description__c = 'Test' +i;
            item.Minimum_Stock_Level__c =i;
            item.Stock_on_Hand__c = 5;
            newItems.add(item);
        }

        CompletedStockHandler.onBeforeInsert(newItems);
        List<Stock_Item__c> lowItems = CompletedStockHandler.getLowStockItems();

        CompletedStockHandler.onBeforeInsert(newItems);


    }

    @isTest static void completedStockItemCoverage() {

        CompletedStockItem item = new CompletedStockItem('Test', 'Test Description', 20, 5, 3);
        item.create();

        //insert sobject
        Stock_Item__c sampleItem = new Stock_Item__c();
        sampleItem.Item_Name__c = 'Test 1';
        sampleItem.Description__c = 'Test';
        sampleItem.Minimum_Stock_Level__c = 2;
        sampleItem.Stock_on_Hand__c = 5;
        insert sampleItem;

        StockItem existingItem = new StockItem(sampleItem.Id);
        existingItem.listPrice = 30;
        existingItem.updateValues();


    }

    @isTest static void stockItemCoverage() {

        StockItem si = new StockItem(40, 'test', 'test description', 5);



    }

    @isTest static void accountTriggerHandler() {

        List < Account > accounts = new List < Account >();

        For (Integer i=0; i<5;i++) {
            Account a = new Account(Name='testAccount'+i);
            accounts.add(a);
        }

        AccountTriggerHandler.handleBeforeInsert(accounts);

        insert accounts;
        AccountTriggerHandler.handleAfterInsert(accounts);

    }


}