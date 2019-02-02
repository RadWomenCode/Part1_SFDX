public with sharing class ContactTriggerHandlerV2 {

	//Variables to store Trigger.oldMap & Trigger.newMap
	Map<ID, Contact> oldContactsMap;
	Map<ID, Contact> newContactsMap;

	//Constructor that takes in the map of old contact records and new/updated contact records and assigns them to class variables
	public ContactTriggerHandlerV2(Map<ID, Contact> oldTriggerContacts, Map<ID, Contact> newTriggerContacts) {
		oldContactsMap = oldTriggerContacts;
		newContactsMap = newTriggerContacts;
	}

    //Handler Methods
    public void onBeforeInsert() {

    }

    public void onAfterInsert() {

    }

    public void onBeforeUpdate() {

    }

    //After a Contact is updated, check to see if it has an associated account and an email address
    //Contacts without these are often junk.  If they are missing either, create a case so that someone looks into it
    public void onAfterUpdate() {

        //create a list to hold any new cases we may create
        List<Case> newCases = new List<Case>();

        //Now go through each Contact and see if they need a case
        for (Contact c : newContactsMap.values()) {
            if (c.AccountId == NULL && c.Email == NULL) {
                System.debug('noAccount&NoEmail');
                Case cse = new Case();
                cse.Status = 'New';
                cse.Origin = 'Questionable Contact';
                cse.Subject = 'Clean up Contact Record';
                cse.ContactId = c.Id;
                cse.Description = 'This contact is not attached to an account and does not have an email address.  Is it needed?';
                newCases.add(cse);
            }
        }

        insert newCases;

    }

    public void onBeforeDelete() {

    }

    public void onAfterDelete() {

    }

    public void onUndelete() {

    }


}