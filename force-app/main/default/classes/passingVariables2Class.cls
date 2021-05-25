public class passingVariables2Class {

    public String Var01 { get; set; }
    
    public passingVariables2Class(){
        Var01 = Apexpages.currentPage().getParameters().get('MyVariable');
    }
}