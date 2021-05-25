global class BulkNoticeSchcontroller{
  
    WebService static String Schdcontroller()
    {
        Datetime currentTime = datetime.now();  
        Datetime newTime = currentTime.addSeconds(20);  
        // build cron expression  
        String sch= String.valueOf(newtime.second()) +' ' + String.valueOf(newtime.minute()) + ' ' + String.valueOf(newTime.hour()) + ' ' + String.valueOf(newTime.day()) + ' ' + String.valueOf(newTime.month()) + ' ? ' +  String.valueOf(newTime.year());  
        BulkNotice_Schedular scheduleObject = new BulkNotice_Schedular();  
        //BottleUpdateBatch scheduleObject = new BottleUpdateBatch();
        Id sId = system.schedule('BottleUpdate'+newtime , sch, scheduleObject ); 
        return sId ;
    }
}