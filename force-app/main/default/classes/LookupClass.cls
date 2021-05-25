//  *******************linked with custom looup page**********************
// ******************* vf page is lookup *********************************


public with sharing class LookupClass {
public list<mobile__c> mob{set;get;} 
    
    public LookupClass (){
        mob = [select name from mobile__c];
    }

}