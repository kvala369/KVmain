Public class CasePDFController{
    
    public case currentRecord{get; set;}

    public CasePDFController(ApexPages.StandardController controller){
        
        currentRecord = [SELECT Id,Status FROM case WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
    }
    
    
}