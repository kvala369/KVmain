public class CasePDFCompCont{
    
    @AuraEnabled
    public static List<case> getcaserecords(String RecId){
        system.debug('recordId----'+RecId);
        
        List<case> lstOfRec = [select Id,Status,CreatedDate,ClosedDate from case where id =: RecId];
        
        system.debug('lstOfRec ----'+lstOfRec );
        return lstOfRec;
    }
}