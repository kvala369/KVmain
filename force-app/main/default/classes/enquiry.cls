public with sharing class enquiry {
    public String course { get; set; }
    public String trainer { get; set; }
    //set  ==  vf to controller
    // get   ==  controller  to vf
     List<Trainer__c> enq = new List<Trainer__c>();
    List<subject__c> enq1 = new List<subject__c>();
    public List<Trainer__c> getrecords()
    {
     return enq;
    }
    public List<subject__c> getrecords1()
    {
     return enq1;
    }
   
    public PageReference search() {
    //sosL SYNTAX
    //String searchquery='FIND\'trainer*\'IN ALL FIELDS RETURNING Trainer__c(Id, Name), subject__c, enquiry__c'; 
    //searchList =search.query(searchquery);
     
     if(trainer!=null)
      enq =[select id,name from Trainer__c where name=:trainer];
     if(course!=null)
      enq1 =[select id,name from subject__c where name=:course];  
       
        return null;
      }
}