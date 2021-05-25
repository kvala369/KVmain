public class DeletingChkbxRowCtrlr {
    public List<WrapperClass> listWrapper {get;set;}
    public Boolean allBool {get;set;}
    
    public DeletingChkbxRowCtrlr() {
        listWrapper = new List<WrapperClass>();
        List<Employee__c> listEmp = [SELECT Id, Name, Age__c FROM Employee__c];
        if(listEmp.size() > 0) {
        system.debug('listEmp--------------------'+listEmp);
            for(Employee__c emp : listEmp) {
                listWrapper.add(new WrapperClass(emp));
            }
        }
    }
    
    public class WrapperClass {
        public Boolean checked {get;set;}
        public Employee__c emp {get;set;}
        public WrapperClass(Employee__c emp) {
            this.emp = emp;
            system.debug('emp--------------------'+emp);
        }
    }
    
      
    public void del() {
         system.debug('listWrapper--------------------'+listWrapper);
        List<Employee__c> listEmpForDel = new List<Employee__c>();
        List<WrapperClass> listTempWrapper = new List<WrapperClass>();
        for(WrapperClass w : listWrapper) {
            if(w.checked) {
                listEmpForDel.add(w.emp);
                system.debug('listEmpForDel--------------------'+listEmpForDel);
            } else {
                listTempWrapper.add(w);
            }
        }
        if(listEmpForDel.size() > 0) {
            delete listEmpForDel;
            system.debug('listEmpForDel--------------------'+listEmpForDel);
            listWrapper = listTempWrapper;
            system.debug('listTempWrapper--------------------'+listTempWrapper);
        } else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Select atleast one employee to delete'));
        }
    }
    
    public void selectAll() {
        if(allBool) {
            for(WrapperClass w : listWrapper) {
                w.checked = true;
            }
        } else {
            for(WrapperClass w : listWrapper) {
                w.checked = false;
            }
        }
    }
}