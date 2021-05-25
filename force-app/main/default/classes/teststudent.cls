public class teststudent{
   public static testmethod  void coll(){
   //integer tot;
     student coll = new student();
     coll.setValues('kalam',143,12,65,98,75,45,85);
     coll.getValues();
     //tot=coll.total();
    // coll.results(tot);
    coll.results(coll.total());
   }

}