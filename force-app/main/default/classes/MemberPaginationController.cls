public class MemberPaginationController {
    public ApexPages.StandardSetController con {
        get {
                if(con == null) {
                    con = new ApexPages.StandardSetController(Database.getQueryLocator([Select Id, Name,phone__c,Quantity__c FROM Bottle__c Order By Name])); 
                    con.setPageSize(5);                      
                }
                return con;
        }
        set;
    }
    
    public List<Bottle__c> getlistMember(){
        return (List<Bottle__c>)con.getRecords();
    }
    
    public Boolean hasNext {
        get {
                return con.getHasNext();
            }
        set;
    }
   
    public Boolean hasPrevious {
        get {
            return con.getHasPrevious();
        }
        set;
    }
   
    public Integer pageNumber {
        get {
            return con.getPageNumber();
        }
        set;
    }
   
    public void first() {
        con.first();
    }
   
    public void last() {
        con.last();
    }

    public void previous() {
        con.previous();
    }
    
    public void next() {
        con.next();
    }
  
   /* public void cancel() {
        con.cancel();
    }    */    
}