//business class 
public class testheight{
//data member, featers in real world
private integer height1;
private integer height2;
//member method
//create
public testheight(){
system.debug('height');
height1=height2=0;
}
//input ==> loadind required values
public void setValues(Integer h1, Integer h2){
    height1 = h1;
    height2 = h2;
    return;
}
//action
//output
public void getValues(){
    system.debug('height1='+height1);
    system.debug('height2='+height2);
    return;
}
}    
//end of the class