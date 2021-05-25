public with sharing class classpagecontroller {

    public list<account> getDiaplay1() {
        list<account> obj = [select id, name, phone from account];
        system.debug('*******************'+obj);
        return obj;
    }

}