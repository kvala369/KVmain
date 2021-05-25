global class after3daysdeleterecord implements Schedulable{
    
    public static String CRON_EXP = '0 0 0 3 * ?';
    
    global void execute(SchedulableContext ctx) {
        //Bottle__c b = [select id, name, CreatedDate from bottle__c];
        //String query = 'select id,name,CreatedDate from bottle__c where LastModifiedDate != LAST_N_DAYS:3';
        //deletebottle delbtl = new deletebottle(query);
        //Id BatchProcessId = Database.ExecuteBatch(delBtl);
        deletebottle1 M = new deletebottle1();
        ID JOBID = Database.ExecuteBatch(M); 
    }
}