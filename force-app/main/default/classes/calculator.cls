public with sharing class calculator {
integer num1;
integer num2;
integer res;
public integer result { get; set; }
public integer result1 { get; set; }
public integer result2 { get; set; }
public string s; 
    public void one(){
    if(result==null){
    result=0;
    }
    else{
    result=result*10+1;
    }
    }
    public void two(){
    if(result==null){
    result=0;
    }
    else{
    result=result*10+2;
    }
    }
    public void three(){
    if(result==null){
    result=0;
    }
    else{
    result=result*10+3;
    }
    }
    public void four(){
    if(result==null){
    result=0;
    }
    else{
    result=result*10+4;
    }
    }
    public void five(){
    if(result==null){
    result=0;
    }
    else{
    result=result*10+5;
    }
    }
    public void six(){
    if(result==null){
    result=0;
    }
    else{
    result=result*10+6;
    }
    }
    public void seven(){
    if(result==null){
    result=0;
    }
    else{
    result=result*10+7;
    }
    }
    public void eight(){
    if(result==null){
    result=0;
    }
    else{
    result=result*10+8;
    }
    }
    public void nine(){
    if(result==null){
    result=0;
    }
    else{
    result=result*10+9;
    }
    }
    public void zero(){
    if(result==null){
    result=0;
    }
    else{
    result=result*10+0;
    }
    }
    public void add(){
     result1 =result;
     result=0;
     s='add';
     }
     public void sub(){
     result1 =result;
     result=0;
     s='sub';
     }
     public void mul(){
     result1 =result;
     result=0;
     s='mul';
     }
     public void div(){
     result1 =result;
     result=0;
     s='div';
     }
     public void clear(){
     result1 =result;
     result=0;
     s='clear';
     }
     public void equal(){
     if(s=='add'){
     result= result1+result;
     }
     else if(s=='sub'){
     result= result1-result;
     }
     else if(s=='mul'){
     result= result1*result;
     }
     else if(s=='div'){
     result= result1/result;
     }
     else if(s=='clear'){
     result= 0;
     }
    }
    
    /*if(result!=0)
    {
    result= result1+result;
    }
    }*/
}