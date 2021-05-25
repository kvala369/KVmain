global class picklistchangespage {

    public String selectval { get; set; }
      
       public String selectval1 { 
          get { return selectval1 ; }
      set { selectval1 = 'page2'; }}
      
   public string action() {
    
    selectval1 = 'page2';
        if(selectval1 == 'b'){
        selectval1 = 'page2';
        system.debug('*************'+selectval1);
        }
    
        return selectval1;
    }


    public List<SelectOption> getItems() {
        list<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('none','none'));
        options.add(new SelectOption('a','a'));
        options.add(new SelectOption('b','b'));
        options.add(new SelectOption('c','c'));
        return options;
    }

}