public with sharing class facebookintegration {

    public String bodyv { get; set; }
      public PageReference click() {
        // Copy of url and paste into main url
        // https://www.facebook.com/dialog/oauth?client_id=1579926645560508&client_secret=71e8deb6b0a5b742582a2fe1897b2223&redirect_uri=https://c.ap1.visual.force.com/apex/facebook_Integration&scope=user_about_me,read_mailbox,read_insights,user_photos,friends_photos,publish_stream,read_friendlists,read_insights,read_requests,read_stream,xmpp_login,ads_management,create_event,manage_friendlists,manage_notifications&state=svtechsoft
        String strcode = Apexpages.currentpage().getParameters().get('code');
        System.debug('strcode =========='+strcode);
        String strurl='https://graph.facebook.com/oauth/access_token?client_id=1466412276959864&'+'redirect_uri=https://c.ap1.visual.force.com/apex/facebook_Integration&'+'client_secret=517896b80f6da9ec7b6f156ed424fe9f&'+'code='+strcode;
        HttpRequest hreq = new HttpRequest();
        hreq.setMethod('GET');
        hreq.setEndpoint(strUrl);
        http h= new Http();
        HttpResponse hres= h.send(hreq);
        System.debug('body=========='+hres.getBody());
        String accesstoken = hres.getBody();
        //in this body gives access code.
        //by using this access code get facebook information.


        //String strdetails ='https://graph.facebook.com/me/friends?'+ accesstoken;
        String strFriendDetails ='https://graph.facebook.com/me/feed?'+accesstoken;
        HttpRequest hreqd = new HttpRequest();
        hreqd.setMethod('GET');
        hreqd.setEndpoint(strFriendDetails );
        HttpResponse resd = h.send(hreqd);
        
        bodyv = resd.getBody();
        System.debug('resd===body==='+resd.getBody());
        return null;
    }

}