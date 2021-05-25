@IsTest
private class BusinessHrHolidaysRetrieverTest{
    
    private static testMethod void testForInvalidData() {
        System.Test.startTest();
        try{
            BusinessHrHolidaysRetriever.retrieveHolidays(null);
            System.assert(false);
        } catch(Exception e) {
            System.assert(true);
        }
        try{
            BusinessHrHolidaysRetriever.retrieveHolidays(new BusinessHours());
            System.assert(false);
        } catch(Exception e) {
            System.assert(true);
        }
        try{
            BusinessHrHolidaysRetriever.retrieveBusinessHrs(null);
            System.assert(false);
        } catch(Exception e) {
            System.assert(true);
        }
        try{
            BusinessHrHolidaysRetriever.retrieveBusinessHrs(new Holiday());
            System.assert(false);
        } catch(Exception e) {
            System.assert(true);
        }
        System.Test.stopTest();
    }
    
    private static testMethod void testForValidBusinessHr() {
        System.Test.startTest();
        List<BusinessHours> bHrs = [SELECT Id FROM BusinessHours];
        if(bHrs.isEmpty()) {
            return;
        }
        
        List<Holiday> holidays = BusinessHrHolidaysRetriever.retrieveHolidays(bHrs[0]);
        System.assert(holidays != null);
        System.Test.stopTest();
    }
    
    private static testMethod void testForValidHoliday() {
        System.Test.startTest();
        List<Holiday> holidays = [SELECT Id FROM Holiday];
        if(holidays.isEmpty()) {
            return;
        }
        
        List<BusinessHours> bHrs = BusinessHrHolidaysRetriever.retrieveBusinessHrs(holidays[0]);
        System.assert(bHrs != null);
        System.Test.stopTest();
    }
}