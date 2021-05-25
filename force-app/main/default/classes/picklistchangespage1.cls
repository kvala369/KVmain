public with sharing class picklistchangespage1{
 public PageReference  page1 { get; set; }
    
    public picklistchangespage1(){
        page1 = new PageReference ('/apex/page1');
    }

    public PageReference changeValue() {
        if(selectval == 'None'){
            page1 = null;
        }else if(selectval == 'A'){
            page1 = new PageReference ('/apex/page1');
        }else if(selectval == 'B'){
            page1 = new PageReference ('/apex/page2');
        }else{
            page1 = new PageReference ('/apex/page3');
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