public class tableclscss {
 
    public List<account> acco { get; set; }
 
    public List<account> getAccount() {
        //SOQL
        acco = [SELECT Id,Name,Website,Industry from Account];
        return acco;
    }
}