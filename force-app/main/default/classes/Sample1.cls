public class Sample1 {
    public String acctName {get;set;}
    public List<SelectOption> listAcctOptions {get;set;}
    public List<Contact> listContacts {get;set;}
    public List<Case> listCases {get;set;}
    public List<Opportunity> listOpptys {get;set;}
    public String acctId {get;set;}
    public String selectedAcctId {get;set;}
    
    public Sample1() {
        listAcctOptions = new List<SelectOption>();
        listContacts = new List<Contact>();
        listCases = new List<Case>();
        listOpptys = new List<Opportunity>();
    }
    
    public void searchAcct() {
        String soql = 'SELECT Id, Name FROM Account WHERE Name LIKE \'' + acctName + '%\' LIMIT 999';
        List<Account> listAcct = Database.query(soql);
        system.debug('Test ' + listAcct);
        if(listAcct.size() > 0) {
            listAcctOptions = new List<SelectOption>();
            listAcctOptions.add(new SelectOption('none', '-----------None-----------'));
            for(Account a : listAcct) {
                listAcctOptions.add(new SelectOption(a.Id, a.Name));
            }
        }
    }
    
    public void fetchRecords() {
        if(selectedAcctId != 'none') {
            listOpptys = [SELECT Id, Name FROM Opportunity WHERE AccountId =: selectedAcctId];
            listContacts = [SELECT Id, Name FROM Contact WHERE AccountId =: selectedAcctId];
            listCases = [SELECT Id, CaseNumber FROM Case WHERE AccountId =: selectedAcctId];
        } else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Select an Account to fetch their records'));
        }
    }
}