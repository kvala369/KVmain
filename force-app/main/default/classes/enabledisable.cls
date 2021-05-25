public class enabledisable {

    public enabledisable(ApexPages.StandardController controller) {
    dis = true;
    }


    public PageReference disable() {
        dis = false;
        return null;
    }
    

    public boolean dis { get; set; }

    //public String value { get; set; }

      

}