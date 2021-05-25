public class DynamicApex {

    public String objquery { get; set; }
    public String obj;
    public string query{get;set;}
    public List<String> objFields {get;set;}
    public String getobj()
    {
        return obj;
    }
   
    public void setobj(String obj)
    {
        this.obj = obj;
    }  
   
    public List<SelectOption> getobjs()
    {
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();   
        List<SelectOption> options = new List<SelectOption>();
              
        for(Schema.SObjectType f : gd)
        {
            options.add(new SelectOption(f.getDescribe().getName(),f.getDescribe().getName()));
        }
        return options;
    }
     public void fetchFields()
    {
        List<String> fields = new List<String>();
        Map<String , Schema.SObjectType> globalDescription = Schema.getGlobalDescribe();
        System.debug('Selected Object is ' + obj);
        Schema.sObjectType objType = globalDescription.get(obj);
        System.debug('Object Type is ' + objType);
        Schema.DescribeSObjectResult r1 = objType.getDescribe();
       
        Map<String , Schema.SObjectField> mapFieldList = r1.fields.getMap(); 
        query = '';
        
        for(Schema.SObjectField field : mapFieldList.values()) 
        { 
            Schema.DescribeFieldResult fieldResult = field.getDescribe(); 
           
            if(fieldResult.isAccessible()) 
            { 
                 //if(String.valueOf(fieldResult.get(field).getDescribe().gettype())=='EMAIL'){
                    System.debug('fieldResult******' + fieldResult.getName());
                    query = query + fieldResult.getName()+',';
                    objquery = 'select'+' '+query ;
                    system.debug('query:::'+query);
                    fields.add(fieldResult.getName());
                //}
            } 
        }
        objquery = objquery.left(objquery.length()-1) +' '+ 'from'+' '+obj;
        
        List<String> so = new List<String>();
        String commaSepratedList='';
        for(String f : fields)
        {
            commaSepratedList += f+ ',' ;
            system.debug('comma*************'+f);
            so.add(f);
        }
        objFields = so;      
    }   
}