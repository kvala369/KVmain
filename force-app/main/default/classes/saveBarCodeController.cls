// visualforce page is : "barcode"

public class saveBarCodeController{
    public String UPC{get;set;}
    public List<product2> prodList{get;set;}
    public List<selectoption> prodValue {get;set;}
    public String selectedProduct{get;set;}
     
    public saveBarCodeController(){
        prodList = new List<product2>();
        prodValue = new List<selectoption>();
        prodValue.add(new selectOption('', '- Select Product -'));
        for (Product2 Prod: [SELECT Id, Name FROM Product2]) {
            prodValue.add(new selectOption(Prod.id,Prod.name));
        }
    }
     
    public void showBarCode(){  
    }
     
    public void saveBarCode(){
        if(selectedProduct == null){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please Select Product.'));
            return;
        }
        else{
            Http h = new Http();
            HttpRequest req = new HttpRequest();
            // URL of the 3rd party web service.
            string firstImageURL = 'http://www.searchupc.com/drawupc.aspx?q=' + UPC;
            //Replace any spaces with %20
            firstImageURL = firstImageURL.replace(' ', '%20');
            req.setEndpoint(firstImageURL);
            req.setMethod('GET');
            req.setHeader('Content-Type', 'image/jpeg');
            req.setCompressed(true);
            req.setTimeout(60000);
                              
            HttpResponse res = null;
            res = h.send(req);
            //These next three lines can show you the actual response for dealing with error situations
            string responseValue = '';
            responseValue = res.getBody();
            system.debug('Response Body for File: ' + responseValue);
            //This is the line that does the magic.  
            //We can get the blob of our file.  
            //This getBodyAsBlob method was added in the Spring 2012 release and version 24 of the API.
            blob image = res.getBodyAsBlob();
             
            // Now save image to Notes and Attachment of Product.
            Attachment n = new Attachment();
            n.ParentId = selectedProduct;
            n.Name = 'BarCode.jpg';
            n.Body = image;
            n.contentType = 'image/jpeg';
            insert n;
        }
    }
    }