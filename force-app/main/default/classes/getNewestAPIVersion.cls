public class getNewestAPIVersion{
    public class VersionResponse
    {
        public String label; 
        public String url; 
        public String version; 
    }
    
    public static String getNewestAPIVersion()
    {
        String url = 'https://' + ApexPages.currentPage().getHeaders().get('Host') + '/services/data';
        system.debug('Url: ' + url); 
        
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(url);
        req.setHeader('Content-Type', 'application/json');
        
        Http http = new Http();
        HTTPResponse resp = http.send(req);
        
        String json = resp.getBody(); 
        system.debug('Body: ' + json); 
        
        List<VersionResponse> parsedList = (List<VersionResponse>)System.JSON.deserialize(json, List<VersionResponse>.class); 
        system.debug('Parsed Body: ' + parsedList); 
        
        String latestVersion = '0'; 
        for (VersionResponse item : parsedList)
        {
            if (latestVersion.compareTo(item.version) < 0)
            {
                latestVersion = item.version; 
            }
        }
        system.debug('Latest Version: ' + latestVersion); 
        
        return latestVersion;
    }
    
}