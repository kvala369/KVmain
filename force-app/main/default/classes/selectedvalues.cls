// visual force page is selectedvalues

public with sharing class selectedvalues {

    public selectedvalues() {
         //page1 = new PageReference ('/apex/lead');
    }
    

    public selectedvalues(ApexPages.StandardController controller) {

    }


    public PageReference  page1 { get; set; }
    
    public PageReference changeValue() {
        if(selectval == 'None'){
            page1 = new PageReference ('http://www.salesforce.com');
        }else if(selectval == 'A'){
            page1 = new PageReference ('../apex/lead?val1='+selectval);
        }else if(selectval == 'B'){
            page1 = new PageReference ('../apex/contact');
        }else{
            page1 = new PageReference ('/apex/pageC');
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