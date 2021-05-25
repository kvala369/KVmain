public with sharing class dpickcontroller {

    public String AID { get; set; }

    public List<SelectOption> getCon2() {
     List<SelectOption> options4 = new List<SelectOption>();
        options4.add(new SelectOption('none','none'));
        options4.add(new SelectOption('Indona','Indona'));
        return options4;
    }
  
    public List<SelectOption> getSta2() {
     List<SelectOption> options5 = new List<SelectOption>();
       options5.add(new SelectOption('none','none'));
       if(country2 == 'none'){
        states = 'ap';
        cities = 'none';
       }
        else if(country2 == 'Indona'){
          options5.add(new SelectOption('AP1','AP1'));
          options5.add(new SelectOption('Jaipur1','Jaipur1'));
          options5.add(new SelectOption('Delhi1','Delhi1'));
        }
        return options5;
    }

    public List<SelectOption> getCit2() {
     List<SelectOption> options6 = new List<SelectOption>();
       options6.add(new SelectOption('none','none'));
        if(states == 'AP1'){
          options6.add(new SelectOption('Hyd1','Hyd1'));
          options6.add(new SelectOption('Mbnr1','Mbnr1'));
          options6.add(new SelectOption('kmm1','kmm1'));
        }
        return options6;
    }
        
    public String cities { get; set; }
    public String states { get; set; }
    public String country2 { get; set; }
    public String city { get; set; }
    public String state { get; set; }
    public String country { get; set; }

    public List<SelectOption> getCon() {
    List<SelectOption> options = new List<SelectOption>();
        //options.add(new SelectOption('none','none'));
        options.add(new SelectOption('INDIA','INDIA'));
        options.add(new SelectOption('US','US'));
        options.add(new SelectOption('CANADA','Canada'));
       // options.add(new SelectOption('MEXICO','Mexico'));
       return options;
    }
  
    public List<SelectOption> getSta() {
     List<SelectOption> options2 = new List<SelectOption>();
      // options2.add(new SelectOption('none','none'));
        if(country == 'none'){
         state = 'ap';
         city = 'none';
        }
        else if(country == 'india'){
          options2.add(new SelectOption('AP','AP'));
          options2.add(new SelectOption('Jaipur','Jaipur'));
          options2.add(new SelectOption('Delhi','Delhi'));
        } else if(country == 'US'){
          options2.add(new SelectOption('New York','New York')); 
          options2.add(new SelectOption('Boston','Boston'));
          options2.add(new SelectOption('Mexico','Mexico'));
        } else if(country == 'Canada'){
          options2.add(new SelectOption('Toronto zoo','Toronto zoo')); 
          options2.add(new SelectOption('Niagara falls','Niagara falls'));
          options2.add(new SelectOption('CN Towers','CN Towers'));
        }
        return options2;
    }

    public List<SelectOption> getCit() {
      List<SelectOption> options3 = new List<SelectOption>();
       options3.add(new SelectOption('none','none'));
        if(state == 'AP'){
          options3.add(new SelectOption('Hyd','Hyd'));
          options3.add(new SelectOption('Mbnr','Mbnr'));
          options3.add(new SelectOption('kmm','kmm'));
          options3.add(new SelectOption('sec','sec'));
        } else if(state == 'New York'){
          options3.add(new SelectOption('‎Central Park','Central Park')); 
          options3.add(new SelectOption('West Village Stroll','West Village Stroll'));
          options3.add(new SelectOption('Grimaldi Pizzeria','Grimaldi Pizzeria'));
        } else if(state == 'Boston'){
          options3.add(new SelectOption('Fenway Park','Fenway Park')); 
          options3.add(new SelectOption('Faneuil hall','Faneuil hall'));
          options3.add(new SelectOption('Castle Island','Castle Island'));
          }
        return options3;
    }
}