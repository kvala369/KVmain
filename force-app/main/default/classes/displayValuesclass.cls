// visualforce page is "displayvalues".

public with sharing class displayValuesclass {

    public PageReference transfer() {
        return null;
    }


    public list<stud__c> getPage() {
        list<stud__c> obj = [select id,name,email__c from stud__c];
        return obj;
    }

}