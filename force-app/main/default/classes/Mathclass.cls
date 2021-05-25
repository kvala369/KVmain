public with sharing class Mathclass {
  Integer num1;
  Integer num2;
  Integer res;
  //Create
  public Mathclass(){
  num1=num2=res=0;
 }
 //Input
 public void setNum1(Integer nm){
 num1=nm;
 }
  public void setNum2(Integer nm2){
 num2=nm2;
 }
  public void setRes(Integer r){
 res=r;
 }
 //output
 public Integer getNum1(){
 return num1;
 }
  public Integer getNum2(){
 return num2;
 }
  public Integer getRes(){
 return res;
 }
 //Action
 public void sub(){
 res=num1-num2;
 }

}//End Of The Class