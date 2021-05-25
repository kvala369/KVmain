public with sharing class popupRedirectclass {

    public PageReference yes() {
        return page.page2;
    }
    
    public PageReference no() {
        return page.page3;
    }
    
    public boolean displayPopUp { get; set; }

    public void showpopup() {
        displayPopup = true; 
        
    }
}