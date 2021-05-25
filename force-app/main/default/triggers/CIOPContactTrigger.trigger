trigger CIOPContactTrigger on Contact(after insert, after Update) {
 
        List<Client__c> roleList=new List<Client__c>();
        List<Contact> lstconts= new List<Contact>();
        Set<Id> conIds=new Set<ID>();
        Set<Id> roleIds = new Set<ID>();
 
        for(Contact cont:Trigger.New)
        {
            conIds.add(cont.Id);
            //lstconts.add(cont.Email);
            system.debug('Printing account Id: '+cont.Id);
        }
 
 
        List<Contact> lstCon = [Select Name,Email From Contact];
        //Map<Id, Role__c> roleMap = new Map<Id, Role__C>(
        List<Client__c> lstrole = [Select Id,Mail__c,Contact__c  from Client__c where Contact__c in: conIds];
            system.debug('lstrole------------------'+lstrole );
            
            List<Client__c > lstR = new List<Client__c >();
            
            for(Client__c objRole :lstrole){
              for(Contact objCo :lstCon){
                   system.debug('objCo --------------'+objCo ); 
                    if(objRole.Contact__c == objCo.Id ){
                        objRole.Mail__c = objCo.Email;
                        lstR.add(objRole);
                    }
                     system.debug('lstR--------------'+lstR); 
            }
        
        
        }
        
        if(lstR.size()>0){
            update lstR;
            system.debug('lstR--------------'+lstR.size());
        }
       
}