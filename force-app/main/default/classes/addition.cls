//  http://bobbuzzard.blogspot.in/
//business class
public class addition{
    integer a;
    integer b;
     static Integer c;// static data members

//constructor default
public addition(){
  a= b= c=10;
    
  }
// member Method
//create
  /*public addition(integer a, Integer b){
  
    this.a = a; 
    this.b = b;
  }
*/
//input
  public void setValues(Integer A,Integer B){
    this.a=A;
    this.b=B;
    
  }   
//action
  public  void ADD(){
    c= a + b;
  }  
  
 /* public  static void SUB(){
    c= a - b;
  }
  
  */  
//output
  public void getValues(){
    System.debug('a = ' + a);
    System.debug('b = ' + b);
     System.debug('c = ' + c);
    return ;
  }
  
}
//End of class