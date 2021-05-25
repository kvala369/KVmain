public class TestPage3con {

    public integer value2 { get; set; }
    public integer value1 { get; set; }
    public integer Result { get; set; }
    public mobile__c mbl {get;set;}
    
    public PageReference Addition() {
    
        Result = value1 + value2;
        return null;
    }
    
    Public TestPage3con(){
        mbl = new mobile__c();
    }
    
}