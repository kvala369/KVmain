public class contactList {

    private ApexPages.StandardSetController ssc;
    
    public contactList()
    {
        List<contact> contactlist = [SELECT Name FROM contact];

        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(contactlist);
        //ssc.setFilterID(YourFilterId);
    }
    
    public List<contact> getContact() {
        return null;
    }

}