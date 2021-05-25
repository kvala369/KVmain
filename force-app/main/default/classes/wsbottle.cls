global class wsbottle{
    webservice static void main(string m, integer p,string q){
        bottle__c mb = New bottle__c();
        mb.name=m;
        mb.Cost__c=p;
        mb.Quantity__c=q;
        insert mb;
    }
}