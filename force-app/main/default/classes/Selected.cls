public with sharing class Selected {
 
public Contact interest {get;set;}
    public account member {get;set;}

    public String accountIdv { get; set; }
    public String accountIdv1 { get; set; }
    
    public contact c{get;set;}
    public Boolean allpbrender { get; set; }
    set<id> ids=new set<id>();
    map<id,decimal> ld=new map<id,decimal>();

    public Boolean selectedrender { get; set; }
    public  decimal itemtotal{get;set;}
    
    public static decimal itemtotall{get;set;}
    
   list<contact> los;
   list<contact> updatcs;
   
    map<string,contact > mpo=new  map<string,contact>();
   

      
     public list<contact> Patients {get;set; } 
      public list<contact> patients1 { get; set; }
      public String Emptymsg { get; set; }
      public String searchFields;
      public string strquery;
       
        public Selected (){        
        
        Patients=(List<contact>)con.getRecords();
        selectedrender =false;
        allpbrender =true;
        
        system.debug('picked val'+se);        
    }
     
      
   public ApexPages.StandardSetController con {                 
    
        get {
        strquery='Select Id, Name,phone,accountid,email FROM contact Order By Name asc limit 100';
    
                if(con == null) {
                    con = new ApexPages.StandardSetController(Database.getQueryLocator(strquery));
                   // Select Id, Name,patient1__c.Blue_Star_Id__c,patient1__c.Provider_Name__c,patient_Id__c,Service_Request_ID__c,patient_LastName__c ,patient_FirstName__c  FROM patient1__c  Order By Name limit 100])); 
                    con.setPageSize(55);                      
                    
                }
                return con;
               
        }
        set;        
    }


    
    public Integer pageNum {
        get {
            return con.getPageNumber();
        }
        set;
    }

    public String getHasNext() {
        return null;
    }


    public List<contact> getlstPb() {
        return null;
    }


    public String idValEntr { get; set; }

    public void last() {
       con.last();
    }


    public void next() {
        con.next();
    }


    public String getHasPrevious() {
        return null;
    }

    public void previous() {
        con.previous();
    }

    public void first() {
        con.first();
    }

    public String labeling { get; set; }

    
    public String getBS() {
        return null;
    }

    public String se { get; set; }

    public String getSer() {
        return null;
    } 
     


    public PageReference doSearch() {
    
    system.debug('dosearch::::::::::::');
    strquery='Select Id, Name,Orders_O__c,Items__c,Proirity__c,No_Of_Items__c FROM contact where name!=null';
          con = new ApexPages.StandardSetController(Database.getQueryLocator(strquery));                    
        Patients=(List<contact>)con.getRecords(); 
       
        return null;
    }   
    public class BiddingsColl
    {
        public contact acc{get; set;}
        public Boolean selected {get; set;}
        public BiddingsColl(contact a)
        {
            acc = a;
            selected = false;
        }
    }
    List<BiddingsColl> BiddingList = new List<BiddingsColl>();
    List<contact> selectedBiddings; 

    public List<BiddingsColl> getBiddings()
    {
        for(contact aa :(List<contact>)con.getRecords()) 
        {
        //[select Id, Name,Orders_O__c,Items__c,No_Of_Items__c,Proirity__c from contact ])
        BiddingList.add(new BiddingsColl(aa));
        }
        return BiddingList ;
    }

    public PageReference getSelected()
    {
    
     selectedrender=true;
    allpbrender =false;
    SelectedBiddings=new List<contact>();
    
        selectedBiddings.clear();
        for(BiddingsColl bidwrapper : BiddingList)
        {
        if((bidwrapper.selected == true))
        {
        SelectedBiddings.add(bidwrapper.acc);
        ids.add(bidwrapper.acc.id);
        
        }
        }
        system.debug('selected recs'+SelectedBiddings);
       PageReference p= new PageReference('/apex/SelectedRecdisp');
       p.setredirect(false);
  
      //PageReference p=new PageReference('');
      
        return null;
    }

    public List<contact> GetSelectedBiddings()
    {
        if(selectedBiddings.size()>0)
        return selectedBiddings;
        else
        return null;
    } 
    public PageReference UpdateContacts() {
    system.debug('param val'+accountIdv1 );
        return null;
    }  
    public void AccountPopulated()
 {
 updatcs=new list<contact>();
     member = [SELECT id,Name FROM account WHERE Id = : interest.accountid];
       // interest.title= member.Name;
 system.debug('account ids'+member.id+member.name);
  for (contact c:selectedBiddings)
  {
  c.accountid=member.id;
  updatcs.add(C);
  }
  update updatcs;
 }

     
}