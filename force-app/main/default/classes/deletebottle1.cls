global class deletebottle1 implements Database.Batchable<sObject>,database.stateful{
    global final String Query;
    global String Valuetosend;
    global Database.QueryLocator start(Database.BatchableContext BC){    
        return Database.getQueryLocator([Select id,name,CreatedDate from bottle__c where CreatedDate = LAST_N_DAYS:3]);     
    }
 
    global void execute(Database.BatchableContext BC,List<bottle__c> scope){
        system.debug('++++++++++'+scope);
        for(bottle__c temp : scope)
        {
         valuetosend = valuetosend + temp.name + ',';
        }
        delete scope;
    }
 
    global void finish(Database.BatchableContext BC){
        //Send an email to the User after your batch completes
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setUseSignature(false);
        mail.setToAddresses(new String[] { 'karthikv369@gmail.com'});
        mail.setSubject('Deleting the ');
        mail.setHtmlBody('Here is the email you requested:Record Deleted '+'\n'+valuetosend );
        //mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); 
 
        // Send the email
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}