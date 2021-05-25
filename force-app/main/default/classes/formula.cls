public class formula{
    decimal a, b, c;
    decimal res1, res2;
      public formula(){
        a=b=c=0;
      }
  public void setValues(decimal a, decimal b, decimal c){
     this.a=a;
     this.b=b;
     this.c=c;
  }
  public void getValues(){
     system.debug('value of a ' + a);
     system.debug('value of b ' + b);
     system.debug('value of c ' + c);
  }
  public void res1(){
   // res1=(-b+((b*b)-(4*a*c)))/(2*a);
    res1=(b*b)-(4*a*c);
    if(res1>0)
    {
    res1= math.sqrt(res1);
    res1=-b+res1;
    res1=res1/(2*a);
     
    system.debug('value of res1............ ' + res1);
    }
    else
     system.debug('value is Imaginary RES1............ ');
  }
  public void res2(){
   // res2=((-b-(b*b)-4*(a*c))/(2*a));
   //res2= (-b-(b*b)-4*a*c)/(2*a);
   //res2=(b*b)-(4*a*c);
   // res2=b+res1;
    //res2=res2/(2*a);
    //res2=(-b-((b*b)-(4*a*c)))/(2*a);
    //system.debug('value of res2...............' + res2);
    res2=(b*b)-(4*a*c);
    if(res2>0)
    {
    res2= math.sqrt(res2);
    res2=-b-res2;
    res2=res2/(2*a);
     system.debug('value of res2............ ' + res2);
    }
    else
     system.debug('value is Imaginary RES2............ ');
  }   
    
  }