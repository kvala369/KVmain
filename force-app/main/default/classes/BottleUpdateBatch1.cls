public class BottleUpdateBatch1{
    string sSessionID;
 
    public BottleUpdateBatch1( String SessionId){
        System.debug('### Loop Started');   
        sSessionID= SessionId;
        System.debug('### SendBulkNotices Started');
        
        List<Bottle__c> BTL = [SELECT Id,Name,Reason__c FROM Bottle__c];
        System.debug('BTL*********'+BTL);
        if(BTL.size()>0)
        {
            try{
                for(Bottle__c acc : BTL){
                     acc.Reason__c = '';  
                     System.debug('acc*********'+acc);  
                     Update acc;
                     System.debug('updated*********'+acc); 
                }
                
                //Update acc;
            }
            catch(Exception e)
              {
                  //System.debug('### SendBulkNotices Exception  '+e);
              }
        }
        
        //Update acc;
    }
}