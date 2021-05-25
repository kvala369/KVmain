public with sharing class invoice {

    public String inv { get; set; }
    public list<invoice__c> lst;
    public invoice(){
        lst =[select id,name,Vendor__c,Total__c,Amount__c,Rate__c from invoice__c];
    }
}