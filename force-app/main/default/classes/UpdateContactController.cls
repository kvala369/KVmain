public class UpdateContactController {

    public integer totalsuccessrec { get; set; }
    public integer totalrecords { get; set; }
    
    public integer totalunsuccessrec { get; set; }
    public integer totalsuccessreccount { get; set; }
    
    public String nameFile { get; set; }
    
    public list<contact> lcon = new list<contact> ();
    transient public list<id> listids= new list<id>();
    public integer size{get; set;}
    
    //public static final id candRecTypeId = WCT_Util.getRecordTypeIdByLabel('Contact','Employee');

    public List<MyWrapper> wrapper {get; set;}
    public boolean b {get{
        if(wrapper!=null)
          {
          return wrapper.size()>0?true:false;
          }
          else 
          {
          return false;
          }
    }
    }
    
    //  public string csvAsString{get;set;}
    transient public Map<string, contact> conNamesIdMap = new Map<string, contact>();
    transient public Blob contentFile { get; set; }
    String[] filelines = new String[]{};
    List<Contact> Conlist;
    public Contact UpdateCon;
    List<integer> conNames;
    Set<String> conNamesf;
    Set<String> conNamesr;
    public  list<string> num = new list<string> (); 
    Map<Integer, Contact> newlistmap = new Map<Integer, Contact>();
    List<Contact> newCons = new List<Contact>();
    
    public PageReference ReadFile() {
        
        conNamesIdMap =new Map<string, contact>();
        
        /*Validtion if no file selected */
        if(contentFile!=null)
        {
            nameFile =contentFile.toString();
        }
        else
        {
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'Please choose a file to upload !'));
            return null;
        }
        filelines = nameFile.split('\n');
        Conlist= new List<Contact>();
        conNames = new List<integer>();
        conNamesf = new set<String>();
        conNamesr= new set<String>();
        wrapper = new List<MyWrapper>() ;
        listids= new list<id>();
        newlistmap= new Map<Integer, Contact>();
        totalunsuccessrec =0;
        totalsuccessrec =0;
        totalrecords=0;
        totalsuccessreccount=0;
        
        /*Step 1 :: Processing the uploaded file and fetching the various details into  the contact object List newlistmap.*/       
        for (Integer i=1;i<filelines.size();i++)
        {
        totalrecords++;
            String[] inputvalues = new String[]{};
            inputvalues = filelines[i].split(',');
            Contact c = new Contact();
            
            if(inputvalues[0]!=null?inputvalues[0].trim()!='':false){
            c.WCT_Personnel_Number__c=integer.valueOf(inputvalues[0]!=null?inputvalues[0].trim():inputvalues[0]);}

            c.WCT_Benefit_plan__c= inputvalues[1];
            
            conNames.add(integer.valueOf(c.WCT_Personnel_Number__c));   //String.valueOf(c.WCT_Personnel_Number__c)
            newlistmap.put(integer.valueOf(c.WCT_Personnel_Number__c),c);
//            conNamesf.add(c.FirstName);
            Conlist.add(c);
         //   num.add(inputvalues[2]);

           // system.debug('num**********'+num);
        }
        
        //  totalsuccessreccount=totalsuccessrec-totalunsuccessrec;
        
        //create a map with names as key
        // load the map - this will help you find out if an Contact name exists already
        /*Step 2 : Searching for the contacts with the emails ids from the Uploaded file in the SFDC. 
        */
        
        List<Contact> existingConts = [SELECT Id,FirstName,LastName,Email,WCT_Personnel_Number__c,WCT_Benefit_plan__c FROM Contact where WCT_Personnel_Number__c IN :conNames  limit 5000];
        
        /*Step 3 : By this step 'existingConts' has contacts record present in SFDC. 
                  A. Now, Modifying the existing contacts (existingConts) with new values from 'newlistmap' (from uploaded file)
                  B. At the same time remove the record which are been existing from the 'newlistmap' */
        
        for (Contact cont: existingConts)
        {
            If(newlistmap.containsKey(integer.valueOf(cont.WCT_Personnel_Number__c)))
            {
              UpdateCon = newlistmap.get(integer.valueOf(cont.WCT_Personnel_Number__c));
               
               if(UpdateCon.WCT_Benefit_plan__c!=null ){
                  Cont.WCT_Benefit_plan__c=UpdateCon.WCT_Benefit_plan__c;
                }
              
        /*Step 3 B : Deleting the Contact of the existing contact from the newlistmap. By this at the end of this loop, newlistmap will contain only the contact not present in the SFDC.*/
            newlistmap.remove(integer.valueOf(cont.WCT_Personnel_Number__c));
            }
        }
        
        /*Step 4 : Now 'existingConts' has contacts record present in SFDC with modified values from the uploaded files. Now update these contact into SFDC.*/
           if(existingConts.size()>0)
           {
            update existingConts;
           }
        /*Step 5 : Generating the report for End User.
         *        1. Records do not exist : Size of newlistmap. Hint :: Since all existing records are been removed from newlistmap.
         *        2. Records successfully updated : 'totalrecords' (total records in Uploaded file) - (Records do not exist).
         *        3. Update the wrapper class with non existing contact details.
        */
        
        totalunsuccessrec=newlistmap.size();
        totalsuccessreccount=existingConts.size();
        Set<integer> numbers=newlistmap.keySet();
        //list<integer> numbers=newlistmap.keySet();
        system.debug('numbers**********'+numbers);
        for(Integer int1: numbers)
        {
            Contact c=newlistmap.get(int1);
             wrapper.add(new MyWrapper(integer.valueOf(c.WCT_Personnel_Number__c),c.WCT_Benefit_plan__c));
          
           
        }
        
        try
         {
         for(string s:conNamesr)
         {
            if(conNamesf.contains(s))
            {
              conNamesf.remove(s);     
            }
         }

        // Update Cont;
        /* ApexPages.Message msg = new ApexPages.Message(ApexPages.severity.info,'ContactName with Contact Id are the new contact created.Related Contact and Opportunity also created');
         ApexPages.Message msg1 = new ApexPages.Message(ApexPages.severity.info,'ContactName without Contact Id are the existing Contacts');
         ApexPages.addMessage(msg);
         ApexPages.addMessage(msg1);*/

        }
        
        catch (Exception e)
        {

        ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'Contact Email already exist, change Contact Email and try again');
        ApexPages.addMessage(errormsg);

        }
        
        return null;
    }
    
    public List<Contact> getuploadedAccounts()
    {
   
     list<contact> lcon1;
        if (Conlist!= NULL)
        
            if (Conlist.size() > 0){
                conlist.clear();
                return conlist;
            }
               
            else
             return null;               
            else
            return null;
    }  
    
    public PageReference pg() {
     // should change the page********************************************
       return page.ViewUploadedContactsInUI;
    }
    
    public class MyWrapper
    {
      public string BenifitPlan1{get; set;}
      public Integer PersonnelNumber1 {get; set;}
      
      public MyWrapper(Integer PersonnelNumber,string BenifitPlan)
      {
          
          PersonnelNumber1 = PersonnelNumber;
          BenifitPlan1 = BenifitPlan;
      }

    }
}