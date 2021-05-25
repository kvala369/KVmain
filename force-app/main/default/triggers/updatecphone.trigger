trigger updatecphone on Contact (after insert,after update,after delete,before delete) {
    List<Account> acc=new  List<Account>();
    List<Account> acc1=new  List<Account>();
    list<contact> cc=new list<contact>();
    List<Account> accList;
    set<id> acid=new set<id>();
    
    List<contact> cList = new List<contact>();

    if(trigger.isafter&&trigger.isupdate || trigger.isInsert)
    {
    for(Contact con  : Trigger.New)  
    {             
        accList = [Select Phone,email__c,ShippingCity from Account where id =: con.AccountId ];                     
              
        if(con.status__c=='Completed')
        { 
            //Trigger Action Logic  
            for(account aa:accList)
            {
                aa.Phone = con.Phone;
                aa.email__c=con.email; 
                aa.ShippingCity=con.MailingCity;
                acc.add(aa);  
             }                       
         }                  
    }
    update acc;
}
            if(trigger.isbefore && trigger.isdelete)
            {
             for(contact c:trigger.old)
            {
             if(c!=null)
            {
            acid.add(c.accountid);
            }
            }
            
            list<contact> contactcurrentid=[select id,name,phone,email,accountid from contact ];
             for(contact cis:contactcurrentid)
            {
            list<account> acl=[select id,name,phone,email__C from account where id in :acid];
             for(account ao:acl )
            {
            if(ao.id==cis.accountid)
            {
            ao.phone='';
            ao.email__C='';
            ao.ShippingCity='';
            acc1.add(ao);
            }
            }
            }   
           }
            update acc1;
}