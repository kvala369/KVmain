@RestResource(urlMapping='/Restclass/*')
global class restclassexample
{
@HttpGet
global static list<Account> getacc()
{
    list<Account> lsta = new list<Account>([Select Id,name from Account]);
    system.debug('***************'+lsta);
    return lsta;
    
}
}