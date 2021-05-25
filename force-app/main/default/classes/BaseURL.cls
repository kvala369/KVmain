public class BaseURL{
    
    public List < Account > listAcct {get;set;}
    
    public BaseURL() {
        listAcct = [ SELECT Id, Name FROM Account ];
    }
    

}