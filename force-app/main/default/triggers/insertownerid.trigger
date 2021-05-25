trigger insertownerid on Opportunity (before insert, before update) {

    set<string> oppacc = new set<string>();
    for(Opportunity opp1 : trigger.new){
        oppacc.add(opp1.accountid);
    }
    
    set<string> oppemail = new set<string>();
    for(Opportunity opp : trigger.new){
        oppemail.add(opp.email__c);
    }
    
    list<user> userlist = [select id,email,name from user where email =: oppemail];
    //list<Opportunity> useracc = [select id,name,AccountId from Opportunity ];
    list<account> useracc = [SELECT Id,Name,OwnerId FROM Account where Id =: oppacc];
    system.debug('userlist ********'+userlist);
    system.debug('oppemail ##########'+oppemail );
    system.debug('o------------'+useracc );
    if(trigger.isinsert){
    for(user u : userlist){
        for(Opportunity opp : trigger.new){
            opp.Ownerid=u.id;
        }
    }
    }
    else if(trigger.isinsert){
    for(account z : useracc){
        for(Opportunity opp1 : trigger.new){
            opp1.Opportunity_ownerID__c=z.OwnerId;
        }
    }
    }
}