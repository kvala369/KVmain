public with sharing class DPLIST {

    public String city { get; set; }
    
    public List<SelectOption> getCit() {
        List<SelectOption> options = new List<SelectOption>();
        
        return options;
    }


    
    public String state { get; set; }
    
    public List<SelectOption> getSta() {
        List<SelectOption> options2 = new List<SelectOption>();
        if(country == 'india'){
            state = 'Ap';
            options2.add(new SelectOption('AP','AP'));
        
        }
        return options2 ;
    }


    
    public String country { get; set; }
    public List<SelectOption> getCon() {
        List<SelectOption> options1 = new List<SelectOption>();
        
        options1.add(new SelectOption('INDIA','INDIA'));
        options1.add(new SelectOption('US','US'));
        options1.add(new SelectOption('CANADA','Canada'));
        return options1;
    }


    
}