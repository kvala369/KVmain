trigger insertAccId on Opportunity (before insert, before update) {
    set<string> oppemail = new set<string>();
   // set<string> oppacc = new set<string>();
    for(Opportunity opp : trigger.new){
        oppemail.add(opp.email__c);
    }
    
    list<user> userlist = [select id,email,name from user where email =: oppemail];
    
    system.debug('userlist ********'+userlist);
    system.debug('oppemail ##########'+oppemail );
    
    
    for(user u : userlist){
        for(Opportunity opp : trigger.new){
            opp.Ownerid=u.id;
        }
    }
    
    
}