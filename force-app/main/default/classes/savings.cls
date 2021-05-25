public abstract class  savings extends banking{
    protected integer minbal;
    
// default constructor
   public savings(){
      super();
      minbal = 500;
   }
   // parameterised constructor
   public savings(string name,integer accno,integer balance,integer minbalance){
      super(name,accno,minbalance);
      minbal = minbalance;
   }
   // setValues
   public virtual void setValues(string name,integer accno,integer balance,integer minbalance){
      super.setValues(name,accno,minbalance);      
      minbal = minbalance;
   }
   //getValues
   public virtual override void getValues(){
      super.getValues();
      system.debug('account minimum-----'+ minbal);
   }
   //action
   Public override Void Withdrawl(integer amt){
   // 50000  1000    60000 49500  45000
     if(amt <= bal - minbal){
            bal -= amt;
     }
     else{
        System.debug('Paisal LEVVU');
     }
   }
}