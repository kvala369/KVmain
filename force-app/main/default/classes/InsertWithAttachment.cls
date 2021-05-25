public class InsertWithAttachment {

    public GBL_Attachments attachmentHelper{get; set;}
    public String bphone { get; set; }
    public String bname { get; set; }
    public String bqty { get; set; }
    
    public InsertWithAttachment(){
        attachmentHelper= new GBL_Attachments();
    }
    
    public PageReference inset() {
    
        Bottle__c btl = new Bottle__c();
        btl.name = bname;
        btl.phone__c = bphone;
        btl.Quantity__c = bqty;
        insert btl;
        attachmentHelper.uploadRelatedAttachment(btl.Id);
        PageReference pg = new PageReference('/apex/InsertWithAttachment');
        return pg;
    }
    
    
    
}