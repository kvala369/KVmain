trigger multipleprimarycontacts on Contact (before insert,before update) {
    
    set<id> accid = new set<id>();
    //list<contact> c1=new list<contact>();
    list<contact> c2=new list<contact>();
    
    if(trigger.isinsert || trigger.isupdate){
        for(contact con:trigger.new){
            accid.add(con.Accountid);
            c2.add(con);
        }
        list<account> acc = [select id,name from Account where id in:accid];
        list<contact> con = [select id,name,primary__c from contact where accountid in:accid AND primary__c=true];
        //list<contact> cs = new list<contact>();
        if(con.size()>0){
            for(contact c:c2){
                if(c.primary__c == true){
                    c.addError('Cannot be primary another contact is primary');
                }
            }
        }
    }
}