public with sharing class ContactListViewController {
    
  public String listName {
    get;
    set {
        listName = 'Email empty';
        String qry = 'SELECT id,Name FROM Contact LIMIT 1';
        system.debug('qry'+qry);
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator(qry));
        List<SelectOption> allViews = ssc.getListViewOptions();
        system.debug('comeon'+allViews);
        for (SelectOption so : allViews) {
          if (so.getLabel() == listName) {
            // for some reason, won't work with 18 digit ID
            listId = so.getValue().substring(0,15);
            system.debug('listID'+listId);
            break;
          }
        }             
    }      
  }
  public String listId {get;set;}
    
}