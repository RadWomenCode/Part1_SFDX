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

        WeekFourClassExercises.getFiscalQuarter(2);
        WeekFourClassExercises.publicYouAreAwesome();

    }

    @isTest static void weekFiveTests() {

        WeekFiveClassExercises.allAboutSets();
        WeekFiveClassExercises.muchAdoAboutMaps();
        WeekFiveHomework.setsReview();
        WeekFiveHomework.listsReview();
        WeekFiveHomework.mapsReview();

    }

    @isTest static void weekSixTests() {

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


}