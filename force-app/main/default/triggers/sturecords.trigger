trigger sturecords on stud__c (before insert, after insert, before update, after update) {
    list<stud__c> s =trigger.new;
    for(stud__c st : s){
        if(st.name == 'siva'){
            st.adderror('donot allow this student');
        }
    }
}