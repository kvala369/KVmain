global class bottlewsdl{
        webservice static void main(string m, integer p, string s){
          bottle__c mb = New bottle__c(); //creating the object
          mb.name=m;
          mb.cost__c=p;
          mb.Quantity__c=s;
          insert mb;
        }
      }