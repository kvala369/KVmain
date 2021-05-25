trigger accountdelete on Account (before delete) {
    for(account acc :trigger.old){
        acc.adderror('you cannot delete the account Record');
    }
}