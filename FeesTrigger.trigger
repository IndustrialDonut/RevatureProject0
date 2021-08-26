//This trigger code updates the account status to inactive when the fees is unpaid.
trigger FeesTrigger on Fees__c (before update) {
	
    FeesHandler.CourseAvailability(trigger.new);
}
