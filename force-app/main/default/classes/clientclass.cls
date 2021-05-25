global class clientclass{
    webservice static void main(string n, integer r){
        stud__c cl = new stud__c();
        cl.name = n;
        cl.Roll_no__c = r;
        insert cl;
    }
}