// visualforce page is "uploadfiles".

public class uploadfilecontroller {

    public invoice__c inc {get; set;}
    public Blob resume { get; set; }
    public String filename { get; set; }
    public String contenttype { get; set; }
    
    public uploadfilecontroller(){
     inc = new invoice__c();
    }
    
    public void saveapplication() {
        insert inc;
        if(resume!=null){
         attachment attach = new attachment();
         attach.body = resume;
         attach.name = filename;
         attach.contenttype = contenttype;
         attach.parentid = inc.id;
        
        try{
         insert(attach);
        }
        catch(system.dmlexception e){
           apexpages.addmessages(e);
        }
    }
    inc.clear();
    }
}