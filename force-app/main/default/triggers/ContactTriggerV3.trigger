trigger ContactTriggerV3 on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

    /***************This Trigger should only be run ONCE******************/
    if( ContactTriggerHandlerV3.hasExecuted ){
        return; // prevent recursive re-entry
    }

    ContactTriggerHandlerV3.hasExecuted= true;
    /*********************************************************************/

    //Instantiate the Contact Handler and pass in records
    ContactTriggerHandlerV3 handler = new ContactTriggerHandlerV3 (Trigger.oldMap, Trigger.newMap);


    if(Trigger.isInsert && Trigger.isBefore){
        handler.onBeforeInsert();
    }

    else if(Trigger.isInsert && Trigger.isAfter){
        handler.onAfterInsert();
    }
    
    else if(Trigger.isUpdate && Trigger.isBefore){
        handler.onBeforeUpdate();
    }

    else if(Trigger.isUpdate && Trigger.isAfter){
        handler.onAfterUpdate();
    }
    
    else if(Trigger.isDelete && Trigger.isBefore){
        handler.onBeforeDelete();
    }

    else if(Trigger.isDelete && Trigger.isAfter){
        handler.onAfterDelete();
    }
    
    else if(Trigger.isUndelete){
        handler.onUndelete();
    }

}