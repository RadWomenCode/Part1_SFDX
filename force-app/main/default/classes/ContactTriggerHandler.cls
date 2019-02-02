public with sharing class ContactTriggerHandler {

    //Handler Methods
    public static void onBeforeInsert(List<Contact> newContacts) {

    }

    public static void onAfterInsert(List<Contact> newContacts) {

    }

    public static void onBeforeUpdate(List<Contact> oldContacts, List<Contact> updatedContacts, Map<Id, Contact> updatedContactMap, Map<Id, Contact> oldContactMap) {

    }

    //After a Contact is updated, check to see if it has an associated account and an email address
    //Contacts without these are often junk.  If they are missing either, create a case so that someone looks into it
    public static void onAfterUpdate(List<Contact> oldContacts, List<Contact> updatedContacts, Map<Id, Contact> updatedContactMap, Map<Id, Contact> oldContactMap) {

        //create a list to hold any new cases we may create
        List<Case> newCases = new List<Case>();

        //Now go through each Contact and see if they need a case
        for (Contact c : updatedContacts) {
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

    public static void onBeforeDelete(List<Contact> contactsToDelete, Map<Id, Contact> deletedContactMap) {

    }

    public static void onAfterDelete(List<Contact> deletedContacts, Map<Id, Contact> deletedContactMap) {

    }

    public static void onUndelete(List<Contact> restoredContacts) {

    }


}