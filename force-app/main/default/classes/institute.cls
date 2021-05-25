//business class 
public class institute{
//data members
   integer fee;
   string name;
   decimal bal;
   integer paid;
   string duration;
//defalt constructor
public institute(){
   fee=null;
   name=null;
   bal=null;
   paid=null;
   duration=null;
   }
//parametric constructor
public institute(integer fee,string name,decimal bal,integer paid,string duration){
   this.fee=fee;
   this.name=name;
   this.bal=bal;
   this.paid=paid;
   this.duration=duration;

}
//member Method
//create

//input
public void setValues(integer fee,string name,integer paid,string duration){
   this.fee=fee;
   this.name=name;
   this.paid=paid;
   this.duration=duration;
}
public void getValues(){
system.debug('Student Name:'+name);
system.debug('Student fee:'+fee);
system.debug('Student bal:'+bal);
system.debug('Student paid:'+paid);
system.debug('Student duration:'+duration);
}
//action
public void balance(){
bal=fee-paid;
system.debug('remaining bal='+bal);
}
//output

}
//end of class