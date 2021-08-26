public class FeesHandler {
    //This code updates the account status to inactive when the fees is unpaid.
    public static void CourseAvailability(List<Fees__c> feePaymentList){
        List<Account> feesToUpdateList = new List<Account>();
        for(Fees__c fees: feePaymentList){
             System.debug('Inside if' +fees.FeePaymentStatus__c);
            if(fees.FeePaymentStatus__c == 'Unpaid'){
               
                List<Account> acctList = [SELECT Status__c FROM Account WHERE Account.Id = :fees.Account__c LIMIT 1];
                    
                    for(Account acct: acctList){
                        acct.Status__c = 'Inactive';
                            feesToUpdateList.add(acct); 
                        }
            } 
                update feesToUpdateList;
         }
    }
}
