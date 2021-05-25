//Test Class
public class TestRectangle{
 public static testMethod void anyName1(){
   Rectangle board = new Rectangle();
   board.getValues();
   board.setValues(6,8);
   board.getValues();
   Integer bd_area = board.area();
   System.debug('The area of Board is ' + bd_area);
   board.perimeter();
//   board.length=7;
   Rectangle inkoboard = new Rectangle();
   inkoboard.setValues(5,7);
   inkoboard.getValues();
   
   Rectangle keyboard = new Rectangle(4,8);
   keyboard.getValues();
 }


}//End of CLass