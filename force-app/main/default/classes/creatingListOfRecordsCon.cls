// visualforce page is "addmultiplerecords2".

public with sharing class creatingListOfRecordsCon {

    public PageReference removingRow() {
        Integer param = Integer.valueOf(Apexpages.currentpage().getParameters().get('index'));
        
       /* for(Integer i=0;i<mobilewrap.size();i++){
            if(mobilewrap[i].counterWrap == param ){
                mobilewrap.remove(i);     
            }
        }*/
        counter--;  
        return null;
    }


    public List<Mobile__c> mobilewrap { get; set; }
    public List<Mobile__c> memberList {get;set;}

    public Integer counter { get; set; }
    
    public void AddRow()
    {
        mobilewrap.add(new mobile__c());
    }  

    public creatingListOfRecordsCon (){
        String sql = 'SELECT Name, qty__c FROM Mobile__c';
        memberList = Database.Query(sql);
        mobilewrap = new List<Mobile__c>();
        mobilewrap.add(new Mobile__c());
    }
}