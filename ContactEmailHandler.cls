public class ContactEmailHandler {
	    public static void CreateEmail(List<Contact> conList, String emailMssg){
	        List<Messaging.SingleEmailMessage> emailsList = new List<Messaging.SingleEmailMessage>();
	        for(Contact currContact: conList){
	        		if(currContact.Email != null){
	                    //Create a new Email
	            		Messaging.SingleEmailMessage singleMail = new Messaging.SingleEmailMessage();
	                    
	                    //Set list of people who should get the email
	            		singleMail.setTargetObjectId(currContact.Id);
	                    
	                    //Emailcontent
	            		singleMail.setHtmlBody(emailMssg);
	            		singleMail.setTreatTargetObjectAsRecipient(true);
	                    
	            		List<String> emailList = new List<String>();
	            		emailList.add(currContact.Email);
	            		singleMail.setToAddresses(emailList);
	                    
	                    //Set who the email is sent from
	                    singleMail.setReplyTo('courses@abcuniversity.com');
	      				singleMail.setSenderDisplayName('University of ABC');
	                    
	                    //Add your email to the master list
	           			 emailsList.add(singleMail);
	        		}
	   			 }
	        
	            //send all emails to the master list
	     		Messaging.sendEmail(emailsList);
	    }
	    
	    public static Boolean validateContactEmail (List<Contact> conList){
	        List<Messaging.SingleEmailMessage> emailsList = new List<Messaging.SingleEmailMessage>();
	        Boolean validationStatus = false;
	        for(Contact currContact: conList){
	            if(currContact.Email != null){
	                if((currContact.Email.containsAny('@')) && (currContact.Email.containsAny('.'))){
	                    validationStatus = true;
	                    continue;
	                }else
	                    {currContact.addError('Invalid Email');
	                    validationStatus = false;}
	            }else 
	                    {currContact.addError(' Email cannot be NULL');
	                    validationStatus = false;}
	        }  
	      return validationStatus;  
	    }
	}
