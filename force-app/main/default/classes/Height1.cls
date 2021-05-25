public class Height1{
  // data members
  Integer feet;
  Decimal inches;
  // member method
  // default constructor
  public Height1(){
    feet = 0;
    inches = 0;
  }
  //parametrised constructor
  public Height1(Integer ft,Decimal inch){
    feet = ft;
    inches = inch;
  }
  //create
  
  //input
  public void setValues(Integer ft,Decimal inch){
    feet = ft;
    inches = inch;
  }
  //action
  public void getvalues(){
   system.debug('Height ='+feet+'feet'+inches+'inches');
  }
  //output
}