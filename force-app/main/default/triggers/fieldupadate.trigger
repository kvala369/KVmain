trigger fieldupadate on Student_Name__c (before update, after update) {
    
    for (Student_Name__c objLocation: trigger.new){
        //if((Trigger.oldMap.get(objLocation.id).address__c != objLocation.address__c)){
        
            if(objLocation.address__c != null ){
              objLocation.count_update__c = True;
            }
        // }
        update objLocation;
    }
}