@isTest
public class ContactEmailHandlerTest {
 	//Tests for Validation
    @isTest
    public static void TP_IsValid(){
	 	List<Contact> testContactList = createContact(true);
        Boolean result = ContactEmailHandler.validateContactEmail(testContactList);
        System.assertEquals(true, result); 
    }
    
    
    @isTest 
    public static void TN_IsValid(){
	 	List<Contact> testContactList = createContact(false);
        Boolean result = ContactEmailHandler.validateContactEmail(testContactList);
        System.assertEquals(false, result);
    }
    
    //Tests for creation of email
    @isTest
    public static void TP_SendEmail(){
 		List<Contact> testContactList = createContact(true);
        insert testContactList;     
    }
    
    @isTest
    public static void TN_SendEmail(){
 		List<Contact> testContactList = createContact(false);
        insert testContactList;     
    }
    
    public static List<Contact> createContact(Boolean test){
        List<Contact> toReturn = new List<Contact>();
        if (test == true){
        	toReturn.add(new Contact(Student_Account__c = '0015e00000JQp0tAAD', Email='anvasri@gmail.com'));
        }
        else{
        	toReturn.add(new Contact(Student_Account__c = '0015e00000JQp0tAAD', Email=null));
        }
        insert toReturn;
        return toReturn;
    }
   
}
