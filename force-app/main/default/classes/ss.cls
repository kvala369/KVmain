// visualforce page is "page1".

public with sharing class ss {

    public Mobile__C mob { get; set; }

public PageReference  page1 { get; set; }
    
    /*public selectedvalues (){
        page1 = new PageReference ('/apex/pageA');
    }*/

    public PageReference changeValue() {
        if(selectval == 'None'){
            page1 = new PageReference ('http://www.salesforce.com');
        }else if(selectval == 'A'){
            page1 = new PageReference ('../apex/lead1?val1='+selectval);
        }else if(selectval == 'B'){
            page1 = new PageReference ('../apex/lead1?val1='+selectval);
        }else{
            page1 = new PageReference ('../apex/lead1?val1='+selectval);
        }
        return null;
    }

    public String selectval { get; set; }

    public list<selectoption> getOptions() {
        list<selectoption> options = new list<selectoption>();
        options.add(new selectoption('None','None'));
        options.add(new selectoption('A','A'));
        options.add(new selectoption('B','B'));
        options.add(new selectoption('C','C'));
        return options;
    }




}