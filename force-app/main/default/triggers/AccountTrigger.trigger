trigger AccountTrigger on Account (before insert, after insert, before update,  after update) {
   switch on Trigger.operationType{
    when BEFORE_INSERT{
        AccountTriggerHandler.setTypeProspect(trigger.new);
        AccountTriggerHandler.addressCopy(trigger.new);
        AccountTriggerHandler.setRating(trigger.new);
    }
    when AFTER_INSERT{
        AccountTriggerHandler.defaultContact(trigger.new);
    }
   }
   
   
}