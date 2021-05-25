public class ContactAuraController {
     
    @AuraEnabled
    Public static List<Contact> getContactList(){
        //get all contact list
        List<Contact> conList = [SELECT Id, Name,Title, Account.Name, Phone, Email,Birthdate,HomePhone,status__c,
                                WCT_Benefit_plan__c,MailingAddress FROM Contact LIMIT 10];
        return conList;
    }
}