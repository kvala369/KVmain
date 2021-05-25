public with sharing class CandidateSearchController {   
    
    private String soql {get;set;}
    // the collection of contacts to display
      Public List<Candidate__c> candidates {get;set;}
    // the current sort direction. deaults to asc
      public String sortDir{
      get { if (sortDir == null) { sortDir = 'asc'; } 
             return sortDir;
             }
             set;
             }
    // the current field to sort by. defaults to last name 
        public String sortField {
          get {
                if  ( sortField == null) {
                sortField = 'Last_Name__c'; } return sortField; }
                set;
                }
      // format the soql for display on the visualforce page 
           public String debugSoql {
              get { return soql + ' order by ' + sortField + ' ' + sortDir + ' limit 20 '; }
               set;
               }
      // init the contrller and display some sample data when the page loads
          public CandidatesearchController() {
            soql='select First_name__c,Last_name__c,City__c,Education__c from Candidate__c where Candidate__c.First_name__c != null';    
                   runQuery();
                   }
        // toggles the sorting  of query from asc<-->desc
            public void toggleSort() {
              //simply toggle the direction  
                   sortDir = sortDir.equals('asc') ? 'desc' : 'asc' ;
                  // run the query again
                    runQuery();
                    }             
        //runs the actualquery
           public void runQuery() {
              try {
                   candidates = Database.query(soql + ' order by ' + sortField + ' ' + sortDir + ' limit 20 ');
                    }
                    catch (Exception e) {
                     ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ' OOOps! ') );
                     }
                   }                                
    // runs the search with parameters passed via JavaScript
      public PageReference runSearch(){
      
      
          String FirstName = Apexpages.currentPage().getParameters().get('First_Name__c');
    String LastName = Apexpages.currentPage().getParameters().get('Last_Name__c');
    String City = Apexpages.currentPage().getParameters().get('City__c');
    String Education = Apexpages.currentPage().getParameters().get('Education__c');
 
    soql='select First_name__c,Last_name__c,City__c,Education__c from Candidate__c where Candidate__c.First_Name__c != null';    

    if (!FirstName.equals(''))
      soql += ' and First_Name__c LIKE \' '+String.escapeSingleQuotes(FirstName)+'%\'';
    if (!LastName.equals(''))
      soql += ' and Last_Name__c LIKE \''+String.escapeSingleQuotes(LastName)+'%\'';
    if (!City.equals(''))
      soql += ' and City__c LIKE \''+String.escapeSingleQuotes(city)+'%\'';  
    if (!Education.equals(''))
      soql += ' and Education__c LIKE (\''+Education+'\')';
 
    // run the query again
    runQuery();
 
    return null;
  }
 
  // use apex describe to build the picklist values
  public List<String> Education {
    get {
      
      
      
      if (Education == null) {
 
        Education = new List<String>();
        Schema.DescribeFieldResult field = Candidate__c.Education__c.getDescribe();
 
        for (Schema.PicklistEntry f : field.getPicklistValues())
         Education.add(f.getLabel());
 
      }
      return Education;          
    }
    set;
  }
 
}