public class student{
   string name;
   integer rollnum;
   integer tel, hin, eng, mat, phy,chem;
   decimal pre;
   String res;
 public student(){
   name=null;
   rollnum=null;
   tel=null;
   hin=null;
   eng=null;
   mat=null;
   phy=null;
   chem=null; 
   //total=null;  
 }
 /*public student(string name,integer rollnum, integer tel, integer hin, integer eng, integer mat, integer phy, integer chem){
 this.name=name;
 this.rollnum=rollnum;
 this.tel=tel;
 this.hin=hin;
 this.eng=eng;
 this.mat=mat;
 this.phy=phy;
 this.chem=chem;
 //this.total=total;
 }*/
 public void setValues(string name,integer rollnum, 
 integer tel, integer hin, integer eng, integer mat, integer phy, integer chem){
 this.name=name;
 this.rollnum=rollnum;
 this.tel=tel;
 this.hin=hin;
 this.eng=eng;
 this.mat=mat;
 this.phy=phy;
 this.chem=chem;
 }
 public void getValues()
 {
 system.debug(' Student Roll Num : ' +rollnum);
 system.debug(' student name :' + name);
 system.debug('marks in Telugu ' + tel);
 system.debug('marks in Hindi '+ hin);
 system.debug('marks in English ' + eng);
 system.debug('marks in Maths ' + mat);
 system.debug('marks in Physics ' + phy);
 system.debug('marks in chemistry' + chem);
 
       
 }
 
 public integer total(){
 
  return (tel+hin+eng+mat+phy+chem);
  
 }
 public void results(integer tot){
 if(tel>34&&hin>34&&eng>34&&mat>34&&phy>34&&chem>34)
 {
     pre=tot/6;  
      if(pre>=75)
        res='distingsion';
       else if(pre>=65)
        res='first class';
       else if(pre>=55)
        res='second class';
       else
        res='third class';
  
 system.debug(' Total : .......... ' +tot);
  system.debug(' Precent : .......... ' +pre);      
 }
     else
       res='fail';
 
 system.debug(' res : .......... ' +res);
     
      
 }
 
 

}
//business class 
//default constructor
//parameterised constructor
//member Method
//create
//input
//action
//output
//end of the class