public class Sample
{  
    public Contact contactDetail {get;set;}
    public sample()
    {
        contactDetail = [SELECT Id, LastName, FirstName, AccountId, Email, MobilePhone, Phone, Department, Fax, ReportsTo.Name, OtherPhone, Description, CreatedById, LastModifiedById FROM Contact WHERE Id = '0039000000PDuwD'];
    } 
    public void editContact()
    {
    }
    public void updateContact()
    {
        update contactDetail;
    }
}