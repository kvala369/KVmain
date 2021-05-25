public with sharing class testComponent {

    public Opportunity opp {get; set;}
    public Boolean disableInput {get; set;}
    public Boolean dis {get; set;}
    
    public void disableCloseDateInput(){
        disableInput = true;
    }
 
    public void enableCloseDateInput(){
        disableInput = false;
    }
    public testComponent(ApexPages.StandardController controller) {
        dis = true;
        opp = new Opportunity();
        
    }
    

}