@isTest

private class ContactHandler_Test {

    @isTest
    static void samplePositiveTest() {
        //Insert a contact with no account and no email and no cases then do an update and validate that a case is created
        Contact c = new contact();
        c.FirstName = 'Sample';
        c.LastName = 'Contact';
        insert c;

        c.LastName = 'UpdatedLastName';
        update c;

        //Select the contact with cases, there should be just one
        Contact validateContact = [SELECT Id, (SELECT Id FROM Cases) FROM Contact WHERE Id = :c.Id];

        //The expected condition comes first, then the condition you're testing
        System.assertEquals(1, validateContact.cases.size());
    }

    @isTest
    static void sampleNegativeTest() {
        //FInsert a contact with no account but with an email and no cases and verify that no case is created(since there is an email)
        Contact c = new contact();
        c.FirstName = 'Sample';
        c.LastName = 'Contact';
        c.Email = 'mysampleemail@test.com';
        insert c;

        c.LastName = 'UpdatedLastName';
        update c;

        //Select the contact with cases, there should be none
        Contact validateContact = [SELECT Id, (SELECT Id FROM Cases) FROM Contact WHERE Id = :c.Id];

        //The expected condition comes first, then the condition you're testing
        System.assertEquals(0, validateContact.Cases.size());
    }

/*	@isTest
	static void sampleFailingTestMethod() {
		//Insert a contact WITH an account but no email and no cases and verify that no case is created(since there is an Account)
		
		Account a = new Account();
		a.Name = 'Sample Account';
		insert a;

		Contact c = new contact();
		c.AccountId = a.Id;
		c.FirstName = 'Sample';
		c.LastName = 'Contact';
		insert c;

		c.LastName ='UpdatedLastName';
		update c;

		//Select the contact with cases, there should be none
		Contact validateContact = [SELECT Id, (SELECT Id FROM Cases) FROM Contact WHERE Id = :c.Id];

		//The expected condition comes first, then the condition you're testing
		System.assertEquals(1, validateContact.cases.size());

	}*/
}