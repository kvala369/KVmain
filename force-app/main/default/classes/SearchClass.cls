public with sharing class SearchClass {
    public list<account> accs;
    public String searchval { get; set; }
    public List<String> listOfStrings {get; set;}
    
    public SearchClass (){
        accs = [select name from account];
        
    }
    public list<account> getAcclist() {
        return accs;
    }

    public PageReference mySearch() {
        accs = [select name from account where name like : searchval];
        return null;
    }

}