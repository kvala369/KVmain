// visualforce page is "invoicepage".

public with sharing class InvoicePage1 {

    public string hst_val { get; set; }
    public decimal hst { get; set; }
    public decimal sub_total { get; set; }
    public String pay_term { get; set; }
    public String des { get; set; }
    public decimal total { get; set; }
    public decimal amt { get; set; }
    public decimal rate { get; set; }
    public decimal hrs { get; set; }
    public date inv_date { get; set; }
    public String client_add { get; set; }
    public String client_name { get; set; }
    public string invoice_no { get; set; }
    public String vendor_value { get; set; }
    public String po_value { get; set; }
    public String service { get; set; }
    public date Today { get{ return Date.today();} set; }
    Invoice__c inv_obj;
    string id = apexpages.currentpage().getParameters().get('id');
    
    public InvoicePage1(){
        system.debug('id :::::::::::::::::::::::::::::::::::::::: '+id);
        if(id != null){
            inv_obj = [SELECT Amount__c,Date__c,HST__c,Id,Name,HST_Percent__c,Payment_Terms__c,Rate__c,Sub_Total__c,Total__c,Vendor__c,po__c,Client__r.Name__c,Client__r.Hour__c,Client__r.To__c,Client__r.Description__c,Client__r.Services__c FROM Invoice__c where client__c =: id];
            system.debug('inv_obj :::::::::::::::::::::::::::::::::::::::: '+inv_obj);
            system.debug('inv_obj :::::::::::::::::::::::::::::::::::::::: '+inv_obj.Client__r);
            system.debug('client :::::::::::::::::::::::::::::::::::::::: '+inv_obj.Client__r.Name__c);
            invoice_no = inv_obj.name;
            client_name = inv_obj.Client__r.Name__c;
            inv_date =  inv_obj.date__c;
            client_add = inv_obj.Client__r.To__c;
            total = inv_obj.total__c;
            amt = inv_obj.amount__c;
            rate = inv_obj.rate__c;
            hrs = inv_obj.Client__r.hour__c;
            des = inv_obj.Client__r.description__c;
            pay_term = inv_obj.Payment_Terms__c;
            sub_total = inv_obj.Sub_Total__c;
            hst = inv_obj.HST__c;
            vendor_value = inv_obj.Vendor__c;
            po_value = inv_obj.po__c;
            service = inv_obj.Client__r.Services__c;
            hst_val = string.valueof(inv_obj.HST_Percent__c);
        }else{
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.error, 'ID not Found'));
        }
    }
}