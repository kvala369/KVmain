trigger btlcost on Bottle__c (before insert, before update) {
    list<bottle__c> bt = trigger.new;
    for(bottle__c b : bt){
        if(b.cost__c < 5000){
            b.adderror('Stock over');
        }
    }
}