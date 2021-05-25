// visualforce page is :- "HomePageOpps"
// displaying the custom object as a related list in the home tab
// reference url : http://jr0cket.co.uk/salesforce-apex-for-admins-workshop/3.2-exercise-visualforce-homepage-component.html

public with sharing class HomePageOppsclass {

    public List<mobile__c> getMobile() {
        
        return [SELECT Id, Name, Price__c, qty__C from mobile__c];
    }

}