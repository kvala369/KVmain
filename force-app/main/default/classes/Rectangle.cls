//Business Class
public class Rectangle{
  //data members, features in Real World
   Integer length;
   Integer breadth;
   Integer res;
  

 //member Methods
 //Create
   public Rectangle(){
     
      length = 0;
      breadth  = 0;
      res= 0;
  }
 
 //Input==> loading required values
  public void setlength(Integer len){
    length = len;
    
  }
  public void setbreadth(Integer bth){
    breadth = bth;
  } 
  public void setres(Integer res1){
    res= res1;
  }
    
 //Action
 public void area(){
    res = length * breadth;
    //return res;
 }
 
 public void perimeter(){
    
    res = 2 * (length + breadth);
    //return res1;
 }
 //Output
  public integer getlength(){
  return length;
  }
  public integer getbreadth(){
  return breadth;
  }
  public integer getres(){
  return res;
  }
  
}//End Of CLass