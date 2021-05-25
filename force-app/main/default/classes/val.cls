// visualforce page is "lead1".

public with sharing class val {

    public String bphone { get; set; }

    public String bqty { get; set; }

    public String name { get; set; }
    public val(){
        name = apexpages.currentpage().getparameters().get('val1');
    
    }
    
     public PageReference inset() {
         Bottle__c btl = new Bottle__c();
         btl.name = name;
         btl.phone__c = bphone;
         btl.Quantity__c = bqty;
         insert btl;
         
         return null;
     }
}