trigger fieldupdate on mobile__c (after insert, after update) {
              
    list<ID> mbid = new list<ID>();
    
    for(mobile__c obj: Trigger.new)
    {
        if (obj.Age__c != Null)
        {
            mbid.add(obj.Case__c);
        }
    }

    List<Case> cases = [SELECT Id, Description FROM Case WHERE id IN : mbid];
                        
    List<Case> caseUpdateList = new List<Case>();
    
    for(mobile__c litem : trigger.new){
    
        for(integer i=0;i<cases.size();i++){
     
            if(litem.Case__c == cases[i].id){
                cases[i].Description ='test';
            }
        }
    }
    update cases ;
}