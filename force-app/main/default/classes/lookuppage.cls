// visualforce page : lookuppage

public class lookuppage {  
 public list<sobject> records{set;get;}  
 public boolean showerror{set;get;}  
 public List<string> fields{private set;get;}  
 public string selectedsobject{get;set;}   
   public lookuppage(){  
   selectedsobject = System.currentPageReference().getParameters().get('sobject');  
   if(selectedsobject == '' || selectedsobject ==null) {  
   showerror = true;  
   }  
   else{  
   showerror = false;  
   }  
   records = new list<sobject>();  
   fields = new List<string>();  
   }  
   public list<sobject> getlistofrecords(){  
    try{  
   fields = new list<string>();  
    Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();   
    Schema.SObjectType systemObjectType = gd.get(selectedsobject);  
    Schema.DescribeSObjectResult r = systemObjectType.getDescribe();   
    Map<String, Schema.SObjectField> M = r.fields.getMap();   
      for(Schema.SObjectField s: M.values()){  
      Schema.DescribeFieldResult fieldResult = s.getDescribe();   
     if( fieldResult.getName()=='Name'){  
     fields.add(fieldResult.getName());  
     }  
      }  
      system.debug('fields::::::::::'+fields);  
      String query='select Id' ;  
      for(string field : fields){  
      if(field.toLowerCase() != 'id' )   
       query+= ','+ field + ' ' ;   
      }  
    query+= ' from ' + selectedsobject+ ' LIMIT 100' ;  
    system.debug('Query:::::::::'+query);  
    records = Database.query(query);  
     system.debug('queried records::::::::::'+records);  
     return records;  
    }  
    catch(exception e){  
    return null;  
    }  
   }  
 }