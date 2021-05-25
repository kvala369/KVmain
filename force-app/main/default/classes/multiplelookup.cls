// visualforce page : multilookup

public class multiplelookup {  
 //variable declaration  
 public string hiddenval{set;get;}  
 public string showinglabel{set;get;}  
 public string selectedsobject{set;get;}  
   //constructor  
   public multiplelookup (){  
   }  
    //method which gets list of sobjects  
   public list<SelectOption> getallsobjects(){  
   Map<String, Schema.SObjectType> demomap= Schema.getGlobalDescribe();  
   Schema.DescribeSObjectResult[] descResult =Schema.describeSObjects(new String[]{'Account','Contact','Lead','Opportunity'});  
   List<SelectOption> options = new List<SelectOption>();  
     options.add(new SelectOption('','--None--'));  
   for(integer i=0;i<=descResult.size()-1;i++){  
   DescribeSObjectResult sobjectRes = descResult[i].sObjectType.getDescribe();  
   system.debug('sobjects:::::'+sobjectRes );  
   options.add(new SelectOption(sobjectRes.getName(),sobjectRes.getName()));  
   }  
     return options;  
   }  
 }