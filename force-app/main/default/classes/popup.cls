// visualforce page is "popup".

public class popup {

     
    public boolean tab_var { get; set; }

    List<Bottle__c> Bottles;

    public List<Bottle__c> getBottles() {
        if(Bottles == null) 
           Bottles= [SELECT Id,Name,price__c,quantity__c FROM Bottle__c LIMIT 10];
           return Bottles;
    }
  
    public PageReference save() {
    
    Bottle__c b=new bottle__c();
    b.name=bname;
    b.price__c=cost;
    //b.quantity__c=qty;
    insert b;
    displayPopup = false;
    tab_var = true;
        return null;
    }

    public Integer qty { get; set; }

    public decimal cost { get; set; }

    public String bname { get; set; }
   
    public boolean displayPopup {get; set;}    
   
    public void closePopup()
    {      
        displayPopup = false;  
    }    
    public void showPopup()
    {      
        displayPopup = true; 
        tab_var = false; 
    }  
}