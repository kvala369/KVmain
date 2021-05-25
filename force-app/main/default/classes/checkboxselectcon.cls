public class checkboxselectcon {

    public String input { get; set; }
    public Boolean displayInputputText { get; set; }
    public Boolean chkBx { get; set; }
    
    public PageReference click1() {
        if(chkBx){
        displayInputputText = true;
        }
        else{
        displayInputputText = false;
        }
        return null;
    }
    
    public Boolean display { get; set; }
    public String input1 { get; set; }
    public Boolean chkBx1 { get; set; }
    public PageReference click2() {
        if(chkBx1){
        display = true;
        }
        else{
        display = false;
        }
        return null;
    }


    
    public Boolean chk2 { get; set; }
    public Boolean chk1 { get; set; }
    public String output { get; set; }

    public PageReference click() {
        if(chk1 == true){
            output = 'check1';
        }
        if(chk2 == true){
            output = 'check2';
        }
        if(chk1 == true && chk2 == true){
            output = 'check1'+', '+'check2';
        }
        return null;
    }

    public Boolean metro {get;set;}
    public Boolean city {get;set;}
    public Boolean bool {get;set;}
    
    public void demo(){
        if(metro)
        {
            bool = true;
        }
        else
        {
            bool = false;
        }        
    }
    

}