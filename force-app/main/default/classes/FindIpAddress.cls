public class FindIpAddress {
public String country {get;set;}
    public String isp {get;set;}
    public String ip {get;set;}
    public integer latitude {get;set;}
    public integer longitude {get;set;}
    public String timezone {get;set;}
  
 public void getipaddress() {
  string ReturnValue = '';  
  ReturnValue = ApexPages.currentPage().getHeaders().get('True-Client-IP');
  if (ReturnValue == '' || ReturnValue == null) {
   ReturnValue = ApexPages.currentPage().getHeaders().get('X-Salesforce-SIP');
  } 
  if (ReturnValue == '' || ReturnValue == null) {
   ReturnValue = ApexPages.currentPage().getHeaders().get('X-Forwarded-For');
  } 
  Http h = new Http();
  HttpRequest req = new HttpRequest();
  req.setEndpoint('http://www.telize.com/geoip/'+ReturnValue);
  req.setMethod('GET');
  HttpResponse res;
  try{
   res = h.send(req);
   Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(res.getbody());
   country =(String)m.get('country');
   isp=(String)m.get('isp');
   ip=(String)m.get('ip');
   latitude=(Integer)m.get('latitude');
   longitude =(Integer)m.get('longitude');
   timezone =(String)m.get('timezone');
  }catch(Exception e){
  }
 }
}