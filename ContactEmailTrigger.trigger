//Trigger to send a welcome email for new students, when a new contact is created
//Email is also sent when the contact informaion is updated


trigger ContactEmailTrigger on Contact (before insert, after insert, before update, after update) {
    
    Switch on trigger.operationType{
        
        when AFTER_INSERT{
            //Create a master list to hold the emails we'll send
			ContactEmailHandler.CreateEmail(trigger.new,'Welcome to ABC University');
    	}
        
        when AFTER_UPDATE{
            ContactEmailHandler.CreateEmail(trigger.new,'Your contact details have been successfully updated!');
        }
        when BEFORE_INSERT{
            ContactEmailHandler.validateContactEmail(trigger.new);
        }
        when BEFORE_UPDATE{
            ContactEmailHandler.validateContactEmail(trigger.new);
        }
    }
}
