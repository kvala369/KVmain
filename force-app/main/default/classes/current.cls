public class current extends savings{
    string com;
   public current(){
      com = 'null';
   }
   public current(string company){
      super();
      com = company;
   }
   public void setValues(integer balance,integer minbalance,string name,integer accno,string company){
      //com = company;
      bal = balance;
      minbal = minbalance;
      this.name = name;
      this.accno = accno;
      com = company;
   }
   public override void getValues(){
      system.debug('account balance-----'+ bal);
      system.debug('account minimum-----'+ minbal);
      system.debug('account name-----'+ name);
      system.debug('account num-----'+ accno);
      system.debug('company name-----'+ com);


   }

}