public class autoCompleteCon {

    public String searchval { get; set; }
    public list<account> accs;
    public List<String> listOfStrings {get; set;}
 
    //Constructor
    public autoCompleteCon() {
      listOfStrings = new List<String>();
      for(Account a: [SELECT id, Name From Account])
      listOfStrings.add(a.name);
      
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