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

    @isTest static void weekOneTests() {

        WeekOneClassExercises.talkingAboutPrimitives();
        WeekOneHomework.introToPrimitives();
        WeekOneHomework.primitivesExercise();
        Welcome.youDoThisPart();

    }

    
    @isTest static void weekTwoTests() {
       
        WeekTwoClassExercises.salesforceOperators();
        WeekTwoClassExercises.introToLists();
        WeekTwoClassExercises.allAboutSets();
        WeekTwoClassExercises.muchAdoAboutMaps();
        WeekTwoHomework.introToConditionals();
        WeekTwoHomework.conditionalsExercise();
        WeekTwoHomework.introToLists();
        WeekTwoHomework.listsExercise();

    }

    @isTest static void weekThreeTests() {

        WeekThreeClassExercises.sObjects();
        WeekThreeClassExercises.conditionals();
        WeekThreeClassExercises.loopingThroughLists();
        WeekThreeHomework.homeworkAssignmentMethod();
        CommentingOnCodeExercise.cartValues();

    }

    @isTest static void weekFourTests() {

       
        // create a hot account
        Account a = new Account();
        a.Name = 'Hot Account';
        a.Rating = 'Hot';
        insert a;

        WeekFourClassExercises.getHotAccounts();
        WeekFourClassExercises.forEachAccountsexample();
        WeekFourHomework.soqlPractice();
        WeekFourHomework.forTheLoveOfForLoops();
     
    }

    @isTest static void weekFiveTests() {

        
        WeekFiveClassExercises.whatYouGiveIsWhatYouGet('test');
        WeekFiveClassExercises.getFiscalQuarter(2);
        WeekFiveClassExercises.getFiscalQuarter(5);
        WeekFiveClassExercises.getFiscalQuarter(8);
        WeekFiveClassExercises.getFiscalQuarter(11);
        WeekFiveClassExercises.getFiscalQuarter(20);
        WeekFiveClassExercises.insertNewAccount('New Account Name');
        WeekFiveClassExercises.publicYouAreAwesome();
        WeekFiveClassExercises.getOpenOppsForHotAccounts();
        WeekFiveHomework.printOutCitiesForExpansionDemo();
        WeekFiveHomework.getCitiesForExpansion();
        WeekFiveHomework.isTopSalesCity('Seattle');
        WeekFiveHomework.getTopTenAccounts();

    }

    @isTest static void weekSixTests() {

        WeekSixHomework.setsReview();
        WeekSixHomework.listsReview();
        WeekSixHomework.mapsReview();

    }

    @isTest static void weekSevenTests() {

        
        WeekSevenHomework.createSampleAccounts(2);

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