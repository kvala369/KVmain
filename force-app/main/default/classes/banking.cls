public virtual class banking{
    protected string name;
    protected integer accno;
    protected integer bal;
   public banking(){
      name = 'null';
      accno = 0;
      bal = 0;
   }
   public banking(string name,integer accno,integer bal){
      this.name = name;
      this.accno = accno;
      this.bal=bal;
   }
   // input
   public virtual void setValues(string name,integer accno,integer bal){
      this.name = name;
      this.accno = accno;
      this.bal=bal;
   }
   //action
   public Void deposit(integer amt){
      Bal+=amt;
      System.debug('Available BAL after Deposit' +bal);
   }
   virtual public Void Withdrawl(integer amt){
      Bal-=amt;
      System.debug('Available BAL after Withdrawl' +bal);
   }
   Public Void BAlenquiry(){
      System.debug('Name of the ACC Holder' +name);
      System.debug('ACC NO: ' + accno);
      System.debug('Available BAL' + bal);
}
   //output
   public virtual void getValues(){
      system.debug('account name-----'+ name);
      system.debug('account num-----'+ accno);
      system.debug('account bal-----'+ bal);

   }
}