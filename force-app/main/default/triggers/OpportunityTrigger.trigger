trigger OpportunityTrigger on Opportunity (before insert, before update, before delete) {
    switch on Trigger.operationType {
        when BEFORE_UPDATE{
            OpportunityTriggerHandler.amountValidation(trigger.new);
            OpportunityTriggerHandler.setPrimaryContact(trigger.new);   
        }
        when BEFORE_DELETE{
            OpportunityTriggerHandler.deleteCloseWonOpportunity(trigger.old);
        }
    }
}