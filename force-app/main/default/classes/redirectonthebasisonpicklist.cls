public class redirectonthebasisonpicklist
 {
public list<selectoption>item{get;set;}
public string picklistvalue{get;set;}
public redirectonthebasisonpicklist()
{
    item=new list<selectoption>();
    item.add(new selectoption('none','none'));
    item.add(new selectoption('page1','page1'));
    item.add(new selectoption('page2','page2'));
}
 
public pagereference redirect()
{
     PageReference pageRef= new PageReference('/apex/'+picklistvalue);
    pageRef.setredirect(true);
    return pageRef;
}
}