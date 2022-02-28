//This is a better example of a trigger. It uses a trigger handler to carry out business logic,
//and it only accepts parameters that have related trigger handlers. It also doesn't have unused if/else statements.
//As a developer works on this trigger in the future, they can easily see when they're writing new trigger logic, or expanding
//on existing logic because the trigger is readable and doesn't have unsued code just hanging out.

trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    
    // First, we have a simpler if/else if block separating inserts from updates 
    // This helps trigger performance and keeps triggers with lots of handlers more readable
    if (Trigger.isInsert) {
        if(Trigger.isBefore){
             AccountTriggerHandler.handleBeforeInsert(Trigger.new);
        } else if(Trigger.isAfter){
             AccountTriggerHandler.handleAfterInsert(Trigger.new);
        }
        
    } else if (Trigger.isUpdate){
        //we don't have any business logic for before updates, so we don't need to have an unused if statement
        if(Trigger.isAfter){
             AccountTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        }
    }
    //future trigger logic blocks here

}