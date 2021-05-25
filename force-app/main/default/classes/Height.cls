//Business Class
public class Height{
  //data members, features in Real World
   Integer feet;
   Integer inches;

 //member Methods
 //Create
   public Height(){
      System.debug('Edhi Manadhi');
      feet = 0;
      inches  = 0;
  }
  public Height(Integer ft,Integer inh){
    feet = ft;
    inches = inh;
  }
  
  public Height(Integer ht){
    feet = inches = ht;
  }
 //Input==> loading required values
  public void setValues(Integer ft,Integer inh){
    feet = ft;
    inches = inh;
    return ;
  }  
  public void setValues(Integer ht){
    feet = inches = ht;
    return ;
  }
 //Action

 //Output
  public void getValues(){
    System.debug('feet = ' + feet);
    System.debug('inches = ' + inches);
    return ;
  } 
}//End Of Class