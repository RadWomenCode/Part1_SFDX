@isTest

private class ContactHandler_Test {

    @isTest
    static void samplePositiveTest() {
        //Insert a contact with no account and no email and no cases then do an update and validate that a case is created
        Contact newContact = new contact();
        newContact.FirstName = 'Sample';
        newContact.LastName = 'Contact';
        insert newContact;

        // Wrap the update in a startTest and stopTest to ensure that the update is processed fully
        Test.startTest();

        newContact.LastName = 'UpdatedLastName';
        update newContact;

        Test.stopTest();

        //Select from cases using the ContactId
        List<Case> newCases = [SELECT Id, CaseNumber FROM Case WHERE ContactId = :newContact.Id];

        //The expected condition comes first, then the condition you're testing
        Assert.areEqual(1, newCases.size(), 'Expected a case');
    }

    @isTest
    static void sampleNegativeTest() {
        //Insert a contact with no account but with an email and no cases and verify that no case is created(since there is an email)
        Contact newContact = new contact();
        newContact.FirstName = 'Sample';
        newContact.LastName = 'Contact';
        newContact.Email = 'mysampleemail@test.com';
        insert newContact;

        // Wrap the update in a startTest and stopTest to ensure that the update is processed fully
        Test.startTest();

        newContact.LastName = 'UpdatedLastName';
        update newContact;

        Test.stopTest();

        //Select from cases using the ContactId
        List<Case> newCases = [SELECT Id, CaseNumber FROM Case WHERE ContactId = :newContact.Id];

        //The expected condition comes first, then the condition you're testing
        Assert.areEqual(0, newCases.size(), 'There should be no case');
    }

/*    @isTest
    static void sampleFailingTestMethod() {
        //Insert a contact WITH an account but no email and no cases and verify that no case is created(since there is an Account)
        
        Account newAccount = new Account();
        newAccount.Name = 'Sample Account';
        insert newAccount;

        Contact newContact = new contact();
        newContact.AccountId = newAccount.Id;
        newContact.FirstName = 'Sample';
        newContact.LastName = 'Contact';
        insert newContact;

        // Wrap the update in a startTest and stopTest to ensure that the update is processed fully
        Test.startTest();

        newContact.LastName ='UpdatedLastName';
        update newContact;

        Test.stopTest();

        //Select from cases using the ContactId
        List<Case> newCases = [SELECT Id, CaseNumber FROM Case WHERE ContactId = :newContact.Id];

        //The expected condition comes first, then the condition you're testing
        Assert.areEqual(1, newCases.size(), 'Expected 1 case but there were ' + newCases.size() + ' cases');

    } */
}