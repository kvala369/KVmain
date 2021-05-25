public class objectList1 {
public String name {get;set;}
     
      public List<SelectOption> getNames()
      {
          List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();   
          List<SelectOption> options = new List<SelectOption>();
        
          for(Schema.SObjectType f : gd)
          {
             options.add(new SelectOption(f.getDescribe().getName(),f.getDescribe().getName()));
          }
          return options;
       }
}