public class ContactLookup_CTRL{
    
 // public Account account {get;set;} // new account to create
  public List<contact> results{get;set;} // search results
  public string searchString{get;set;} // search keyword
  public string label{get; set;}  
  public List<string> filterQuery{get; set;} 
 
  
    public boolean moreThanLimit{get; set;}
    public integer maxLimit{get{
        return 500;
    } set;}
    
  public ContactLookup_CTRL() {
      results= new List<contact>();
      moreThanLimit=false;
      filterQuery= new List<string>();
      
   /* //account = new Account();
    // get the current search string
    searchString = System.currentPageReference().getParameters().get('lksrch');
         JSONParser parser;
      parser = JSON.createParser(System.currentPageReference().getParameters().get('serachFilters'));
      
*/
      
      /*Advance Next Token needed*/
  //    parser.nextToken();
      /*To skip the null for new Interview */
   //   parser.nextToken();
      
   /*  while(parser.nextToken()!=null)
     {
         filterQuery.add(parser.getText());
     }
*/
    }   
   
  // performs the keyword search
  public PageReference search() {
    runSearch();

    return null;
  }
  
  // prepare the query and issue the search command
  private void runSearch() {
    // TODO prepare query string for complex serarches & prevent injections
        if(searchString != '' && searchString != null)
        {
            results = performSearch(searchString); 
        }
                      
  } 
  
  // run the search and return the records found. 
  private List<contact> performSearch(string searchString) {
 
       label='Search Results :';
      moreThanLimit=false;
    String soql = 'select Name, email  from contact';            // WCT_Service_Line__c,WCT_Function__c
    if(searchString != '' && searchString != null)
     soql = soql +  ' where ( email like \'%' + searchString +'%\'';
     soql = soql +  ' or FirstName like \'%' + searchString +'%\'';
     soql = soql +  ' or LastName like \'%' + searchString +'%\' ';
     soql = soql +  ' or Name like \'%' + searchString +'%\' )';
     soql = soql +  ' and RecordType.Name = \'Employee\'';
     //soql = soql +  ' and WCT_Employee_Group__c = \'Active\'';
    soql = soql + ' limit '+(maxLimit+1);
     List<Contact> searchResults= database.query(soql);
      if(searchResults.size()>maxLimit)
      {
          moreThanLimit=true;
      }
    return searchResults; 
 
  }
    

    

  
  // save the new account record
 /* public PageReference saveAccount() {
    insert account;
    // reset the account
    account = new Account();
    return null;
  }*/
  
  // used by the visualforce page to send the link to the right dom element
  public string getFormTag() {
    return System.currentPageReference().getParameters().get('frm');
  }
    
  // used by the visualforce page to send the link to the right dom element for the text box
  public string getTextBox() {
    return System.currentPageReference().getParameters().get('txt');
  }
 
}