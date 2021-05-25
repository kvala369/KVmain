public class searchpage3con {
    public List<case> lstcon{get; set;}
    
    public searchpage3con(){
        lstcon = [select id, CaseNumber, FCPA_PPD_First_Name__c, status, FCPA_PPD_Last_Name__c from Case where recordtype.name =: 'PPD-Referral' ];
    }
    public string searchText{get; set;}
    public void dosearch(){
        lstcon = [select id, CaseNumber, FCPA_PPD_First_Name__c, FCPA_PPD_Last_Name__c,
                    status from case where FCPA_PPD_First_Name__c like:searchtext+'%' OR FCPA_PPD_Last_Name__c like:searchtext+'%' ];
                   /*
                    OR
                    FCPA_Candidate_First_Name__c like:searchtext+'%' OR FCPA_Candidate_Last_Name__c like:searchtext+'%' OR
                    FCPA_Recruiter_Name__c like:searchtext+'%' ];
                    */
    }
    public void viewall(){
        searchtext='';  
        lstcon = [Select id, CaseNumber, FCPA_PPD_First_Name__c, FCPA_PPD_Last_Name__c,
                    status from Case where recordtype.name =: 'PPD-Referral' ];
    }
}