public class GBL_AttachmentController {
    public GBL_Attachments attachmentHelper{get; set;}
    public String label{get;set;}
    public String label2{get;set;}
    public string types{get; set;}
    public string maxLimit;
    public boolean hasLimit{get; set;}
    public integer limitCount{get; set;}
    public string customId{get; set;}
    
    public string getMaxLimit()
    {
        return maxLimit;
    }
    public void setMaxLimit(String s)
    {
        System.debug('### String'+s);
        try
        {
            maxLimit=s;
            limitCount=Integer.valueOf(s);
            hasLimit=true;
        }
        catch(Exception e)
        {
            System.debug('### '+e);
        }
    }
    
    
    public GBL_AttachmentController()
    {
        //attachmentHelper.deleteDocId='asdasd';
        hasLimit=false;
    }
}