global  class BulkNotice_Schedular implements Schedulable  {

  global void execute(SchedulableContext sc) {
      System.debug('## Wage Notice Send Schedular Started');
      BottleUpdateBatch1 sendBulk = new BottleUpdateBatch1(null);
      sendBulkNotice();
      System.debug('## Wage Notice Send Schedular Ended');
      
   }
    
    
    /*Backup plan , if nothing work with automated send. */
   @future(callout=true)
    global static void sendBulkNotice()
    {
      BottleUpdateBatch1 sendBulk = new BottleUpdateBatch1(null); 
    }
}