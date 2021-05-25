global class AttachmentGenerator
{
   webService static String AttachPDFToProposal(string SRId, string ServiceReqId ) 
   {
        string retRes = '';
        try
        {
         Client__c objPro = [Select Id from Client__c where Contact__c = : SRId limit 1];
         PageReference pageRef = new PageReference('/apex/casePDF?rfpId=='+objPro.Id );
         Attachment obj = new Attachment();
         obj.Body=pageRef.getContent();
         obj.Name='Letter of Engagement.pdf';
         obj.ParentId = ServiceReqId;
         obj.ContentType ='pdf';
         insert obj;
         retRes='SUCCESS';
         return retRes;
       }catch(exception ex)
       {
           System.debug('--- Error ----------'+ ex);
           retRes= ex.getMessage();
           return retRes;
       }
   }
}