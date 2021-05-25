// used for the component OpptyList

public  class UserTemplt
{
    //public Id accountId {get;set;}
    public List<user> getuserlist()
    {
        List<user> usr;
        usr = [SELECT id,Name FROM user WHERE name='kiran'];
        system.debug('*****'+usr);
        return usr;
    }
}