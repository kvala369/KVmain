public class passingVariablesClass {

    public String Value2Pass { get; set; }

    public PageReference Transfer() {
        PageReference newPAge = page.passingVariables2;
        newPage.getParameters().put('MyVariable', Value2Pass);
        return newPage;
    }

}