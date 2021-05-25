public class GBL_Attachments {

    public Document doc {get; set;}
    public List<Id> docIdList{get; set;}
    public List<AttachmentsWrapper> UploadedDocumentList{get; set;}
    public string deleteDocId {get;set;}
    public transient blob body{get;set;}
    public GBL_Attachments()
    {
        UploadedDocumentList= new List<AttachmentsWrapper>();  
        doc= new Document();
        docIdList= new List<Id>();
        
    }
    
    
    
    //Documents Wrapper
    public class AttachmentsWrapper
    {
        public Boolean isSelected {get;set;}
        public String docName {get;set;}
        public String documentId {get;set;}
        public String size {get; set;}
        
        public AttachmentsWrapper(Boolean selected, String Name, String Id, String size)
        {
            isSelected = selected;
            docName = Name ;
            documentId = Id;
            this.size = size;
        }        
    }
    
    
    /*Upload the attachmentment to document and upload the UploadedDocumentList*/
    public PageReference uploadDocument()
    {
        system.debug('#ssss');
         if(doc != null)
        {
            system.debug('#ssss 1');
            doc.folderId = SYSTEM.LABEL.Attachment_Zip_Document_Folder_Id;
            doc.body= body;
            if(doc.body != null) 
            {
                system.debug('#ssss 2');
                insert doc;
                docIdList.add(doc.id);
                doc = [SELECT id, name, bodylength FROM Document WHERE id = :doc.id];
                String size = '';
                if(1048576 < doc.BodyLength)
                {
                    // Size greater than 1MB
                    size = '' + (doc.BodyLength / 1048576) + ' MB';
                }
                else if(1024 < doc.BodyLength) 
                {
                    // Size greater than 1KB
                    size = '' + (doc.BodyLength / 1024) + ' KB';            
                }
                else 
                {
                    size = '' + doc.BodyLength + ' bytes';
                } 
                UploadedDocumentList.add(new AttachmentsWrapper(true, doc.name, doc.id,size));
                doc = new Document();
               
            }   
        }
        return null;
    }
    
    /*Upload documents to Attachment. */
   public void uploadRelatedAttachment(id requestId)
   {
      if(!docIdList.isEmpty()) 
      { //If there is any Documents Attached in Web Form
        List<String> selectedDocumentId = new List<String>();
        for(AttachmentsWrapper aWrapper : UploadedDocumentList)
        {
            selectedDocumentId.add(aWrapper.documentId);
        }
        /* Select Documents which are Only Active (Selected) */
        List<Document> selectedDocumentList = new List<Document>();
        if(!selectedDocumentId.isEmpty())
        {
            selectedDocumentList = [SELECT id,name,ContentType,Type,Body FROM  Document WHERE  id IN :selectedDocumentId];
        }
        /* Convert Documents to Attachment */
        List<Attachment> attachmentsToInsertList = new List<Attachment>();
        for(Document doc : selectedDocumentList)
        {   Attachment a = new Attachment();
            a.body = doc.body;
            a.ContentType = doc.ContentType;
            a.Name= doc.Name;
            a.parentid = requestId; 
            attachmentsToInsertList.add(a);                
        }
        if(!attachmentsToInsertList.isEmpty())
        {
            insert attachmentsToInsertList;
        }
        List<Document> listDocuments = new List<Document>();
        listDocuments = [SELECT Id FROM Document WHERE Id IN :docIdList];
        if( (null != listDocuments) && (0 < listDocuments.size()) )
        {
            delete listDocuments;
        }
          docIdList.clear();
      }
    }
    
      public PageReference deleteAttachment()
    {
        if(deleteDocId!='')
        {
            Integer j = 0;
                while (j < UploadedDocumentList.size())
                {
                  if(UploadedDocumentList.get(j).documentId == deleteDocId)
                  {
                    UploadedDocumentList.remove(j);
                  }
                    else
                  {
                    j++;
                  }
                }
            
        }
        return null;
        
    }    
    
    
}