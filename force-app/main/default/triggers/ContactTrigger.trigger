trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
	//Each control statement below handles a different type of trigger action.  There is a handler method for each of the trigger_events defined above
	//(before insert, after insert etc..)  This allows us to pass only the needed context variables to the handler method.  For example,
	//a before insert trigger have trigger.new populated, but nothing in trigger.old since there is no record being updated, just new records ready to be inserted
	//conversly, a before or after Update trigger will need the trigger.new(updated records) and trigger.old(records before the update) so that we
	//can compare the  two and know what is changing.  For more information on Trigger context variables: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_triggers_context_variables.htm
	
	//This is a simple but effective pattern.  For very large or complex orgs, a more complex pattern may be needed.  When you're ready for more
	//advanced patterns, I reccomend Dan Appleman's Advanced Apex Programming book, and the blogs of Jeff Douglas and Bob Buzzard, but there's lots out there!
	

	if(Trigger.isInsert && Trigger.isBefore){
		ContactTriggerHandler.onBeforeInsert(Trigger.new);
	}

	else if(Trigger.isInsert && Trigger.isAfter){
		ContactTriggerHandler.onAfterInsert(Trigger.new);
	}
	
	else if(Trigger.isUpdate && Trigger.isBefore){
		ContactTriggerHandler.onBeforeUpdate(Trigger.old, Trigger.new, Trigger.newMap, Trigger.oldMap);
	}

	else if(Trigger.isUpdate && Trigger.isAfter){
		ContactTriggerHandler.onAfterUpdate(Trigger.old, Trigger.new, Trigger.newMap, Trigger.oldMap);
	}
	
	else if(Trigger.isDelete && Trigger.isBefore){
		ContactTriggerHandler.onBeforeDelete(Trigger.old, Trigger.oldMap);
	}

	else if(Trigger.isDelete && Trigger.isAfter){
		ContactTriggerHandler.onAfterDelete(Trigger.old, Trigger.oldMap);
	}
	
	else if(Trigger.isUndelete){
		ContactTriggerHandler.onUndelete(Trigger.new);
	}

}