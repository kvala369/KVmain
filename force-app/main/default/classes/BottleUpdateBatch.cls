global class BottleUpdateBatch implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT Id,Name,Reason__c FROM Bottle__c';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Bottle__c> scope){
         for(Bottle__c acc : scope){
             acc.Reason__c = 'UpdatedByBatch';            
         }
         update scope;
    }   
    global void finish(Database.BatchableContext BC){ }
}