global class Mobile{
 webservice static void yedo(string m, integer p){
  Mobile__c mb = New Mobile__c();
  mb.name=m;
  mb.Price__c=p;
  insert mb;
 }
}