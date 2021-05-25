public class SendBulkNotices  {
    
    string sSessionID;
 /*
    public SendBulkNotices( String SessionId)
    {
     System.debug('### Loop Started');   
       sSessionID= SessionId;
        System.debug('### SendBulkNotices Started');
        List<String> urls= new List<String>();
        
        List<Wage_Notice__c> readyToSentWageotices = [Select id, WTPAA_Related_To__c From Wage_Notice__c where WTPAA_Status__c='Ready To Send' and WTPAA_Is_Notice_Sent__c=false and WTPAA_Batch_controlled__c = true];
        if(readyToSentWageotices.size()>0)
        {
               String sOrgID = UserInfo.getOrganizationId().substring(0,15);
               Id userID = UserInfo.getUserId();
          
               String sCongaUrl = 'https://www.appextremes.com/apps/Conga/PM.aspx?';
               urls = new List<String>();
             try
              {
                 
                  
                  for(Wage_Notice__c wageNotice :readyToSentWageotices)
                  {
                          Id TemplateId = Label.WTPAA_Wage_Notice_Template_1_ID;
                          String wageNoticeId = wageNotice.ID;
                          wageNoticeId = wageNoticeId.substring(0,15);
                          String message = label.ESWageNotice;
                          
                          Datetime dt = System.now().addDays(21); 
                          Date d = Date.newInstance(dt.year(), dt.month(), dt.day());  
                          String nextDate = d.format();
                          message = message.replace('#DATE#', nextDate);
                          message = EncodingUtil.urlEncode(message, 'UTF-8');
                          
                          String docUrl = sCongaUrl
                                            
                                            + '&serverUrl='
                                            + EncodingUtil.urlEncode( URL.getSalesforceBaseUrl().toExternalForm(), 'UTF-8')
                                            + '%2Fservices%2FSoap%2Fu%2F9.0%2F'
                                            + sOrgID
                                            + '&Id='
                                            + wageNoticeId
                                            + '&TemplateId='
                                            + TemplateId 
                                            + '&DefaultPDF=1'
                                            + '&OFN=Wage_Notice'
                                            + '&ESVisible=1'
                                            + '&ESExpireInXDays=120' 
                                            + '&ESMessage='
                                            + message                            
                                            + '&ESRemindRecipient=1' 
                                            + '&ESContactId='
                                            + wageNotice.WTPAA_Related_To__c
                                            + '&ESAgreementName=Your+Acknowledgement+of+Wage+Rate'
                                            + '&ESSignatureType=2'
                                            + '&ESCustomField1=WageNotice__c'
                                            + '&ESCustomFieldValue1='
                                            + wageNoticeId
                                            + '&ESSVBA=1&DS7=14';
                      
                      System.debug('### SendBulkNotices Temp URL '+docUrl);
                      
                  urls.add(docUrl);
                      
                  }
                  
                  System.debug('### SendBulkNotices Batch Called');
                  Database.executebatch(new  WCT_Batch_CongaComposerHTTPCallout(urls, false),5);
                  System.debug('### SendBulkNotices Batch Ended');
              }
              catch(Exception e)
              {
                  System.debug('### SendBulkNotices Exception  '+e);
              }
            
        }
        
    }
*/
}