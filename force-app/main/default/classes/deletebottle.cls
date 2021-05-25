global class deletebottle implements Database.Batchable<sObject>,database.stateful{
    global final String Query;
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        Date dToday = system.today();
        system.debug('+++++++++++++++++++++++'+dToday );
        Date dToday1 =System.today().addDays(-3);
        system.debug('******************'+dToday1 );
        string q = 'Select id,CreatedDate from bottle__c where CreatedDate =: dToday';
        system.debug('+++++++++++++++++++++++'+q);
        return Database.getQueryLocator(q);
        
        
    }
 
    global void execute(Database.BatchableContext BC,List<bottle__c> scope){
        List <bottle__c> btl = new list<bottle__c>();
        system.debug('+++++++++++++++++++++++'+btl);
        for(bottle__c b : scope){
            //b.CreatedDate
        }
        delete scope;
    }
 
    global void finish(Database.BatchableContext BC){
        //Send an email to the User after your batch completes
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setUseSignature(false);
        mail.setToAddresses(new String[] { 'karthikv369@gmail.com'});
        mail.setSubject('Deleting the ');
        mail.setHtmlBody('Here is the email you requested:Record Deleted ');
        //mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); 
 
        // Send the email
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}