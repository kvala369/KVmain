// visualforce page is insertbottle

public class insertbottle {

    public String bphone { get; set; }
    public String bname { get; set; }
    public String bqty { get; set; }
   
    public boolean pageError {get; set;}
    public String pageErrorMessage {get; set;}

   PageReference pg = new PageReference('/apex/insertbottle');

    public PageReference inset() {
        
        if(bname == null || bname == '')
        {
            pageErrorMessage ='Name should not be null';
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, pageErrorMessage ));                      
        }
    
        Bottle__c btl = new Bottle__c();
        btl.name = bname;
        btl.phone__c = bphone;
        btl.Quantity__c = bqty;
        try{
            insert btl;
        } catch(System.DmlException e){
            
            pageErrorMessage = e.getDmlMessage(0);
            WCT_ExceptionUtility.logException('insertbottle', 'insertbottle', e.getMessage());
            pageError =true;
            //return null;
        }
        return pg;
    }
    
}