/**
 *  Author:     Lalit Mistry
 *  Company:    Arxxus Technology Partners
 *  Desc:       This is a helper class to read the relationship between business hours and holiday.
 *              Users can use this class to retrieve list of holidays associated with a given business hours and vice-versa
 *  Test Class: BusinessHrHolidaysRetrieverTest
 *
 *  History:    
 *  ----------------------------------------------------------------------
 *  Date                Author                  Desc
 *  ----------------------------------------------------------------------
 *  11th Jan, 2015      Lalit Mistry            Created
 */
public with sharing class BusinessHrHolidaysRetriever {
    
    /**
     *  Author:     Lalit Mistry
     *  Company:    Arxxus Technology Partners
     *  Desc:       Helper method to retrieve list of holidays associated with a given business hours.
     *  Input:      BusinessHours instance for which list of associate holidays needs to be retrieved
     *  Output:     List of holidays associated with a given business hour.
     *  Exception:  Throws InvalidDataException if input business hour record is invalid.
     *
     *  History:    
     *  ----------------------------------------------------------------------
     *  Date                Author                  Desc
     *  ----------------------------------------------------------------------
     *  11th Jan, 2015      Lalit Mistry            Created
     */
    public static List<Holiday> retrieveHolidays(BusinessHours bh) {
        if(bh == null || bh.Id == null) {
            throw new InvalidDataException('Failed to retrieve holidays for a given business hour. Input business hour is invalid');
        }
        List<BusinessHours> bHrs = [SELECT Id FROM BusinessHours WHERE Id = :bh.Id];
        if(bHrs.isEmpty()) {
            throw new InvalidDataException('Failed to retrieve holidays for a given business hour. Input business hour is invalid');
        }
        PageReference pg = new PageReference(BusinessHrHolidaysRetrieverConstants.HOLIDAY_URL_PREFIX + bh.Id);
        system.debug('pg***********'+pg);
        Blob content = Blob.valueOf(BusinessHrHolidaysRetrieverConstants.BLOB_CONTENT_FOR_HOLIDAY_TEST);
        if(!System.Test.isRunningTest()) {
            content = pg.getContent();
        }
        Set<String> holidayIds = retrieveBusinessHourHolidays(BusinessHrHolidaysRetrieverConstants.HOLIDAY_PREFIX, content);
        system.debug('h ids***********'+holidayIds);
        system.debug('h ids1***********'+BusinessHrHolidaysRetrieverConstants.HOLIDAY_PREFIX);
        system.debug('h ids2**********'+content);
        List<Holiday> holidays = [  SELECT SystemModstamp, StartTimeInMinutes, RecurrenceType, RecurrenceStartDate, RecurrenceMonthOfYear, 
                                        RecurrenceInterval, RecurrenceInstance, RecurrenceEndDateOnly, RecurrenceDayOfWeekMask, RecurrenceDayOfMonth, Name,
                                        LastModifiedDate, LastModifiedById, IsRecurrence, IsAllDay, Id, EndTimeInMinutes, Description, CreatedDate, CreatedById, ActivityDate 
                                    FROM Holiday 
                                    WHERE Id IN :holidayIds ];
        system.debug('holidays***********'+holidays);
        return holidays;
    }
    
    /**
     *  Author:     Lalit Mistry
     *  Company:    Arxxus Technology Partners
     *  Desc:       Helper method to retrieve list of business hours associated with a given holiday.
     *  Input:      Holiday instance for which list of associate business hours needs to be retrieved
     *  Output:     List of business hours associated with a given holiday.
     *  Exception:  Throws InvalidDataException if input holiday record is invalid.
     *
     *  History:    
     *  ----------------------------------------------------------------------
     *  Date                Author                  Desc
     *  ----------------------------------------------------------------------
     *  11th Jan, 2015      Lalit Mistry            Created
     */
    public static List<BusinessHours> retrieveBusinessHrs(Holiday holiday) {
        if(holiday == null || holiday.Id == null) {
            throw new InvalidDataException('Failed to retrieve business hours for a given holiday. Input holiday is invalid');
        }
        List<Holiday> holidays = [SELECT Id FROM Holiday WHERE Id = :holiday.Id];
        if(holidays.isEmpty()) {
            throw new InvalidDataException('Failed to retrieve business hours for a given holiday. Input holiday is invalid');
        }
        PageReference pg = new PageReference(BusinessHrHolidaysRetrieverConstants.BUSINESS_HR_URL_PREFIX + holiday.Id);
        Blob content = Blob.valueOf(BusinessHrHolidaysRetrieverConstants.BLOB_CONTENT_FOR_HOLIDAY_TEST);
        if(!System.Test.isRunningTest()) {
            content = pg.getContent();
        }
        Set<String> businessHrIds = retrieveBusinessHourHolidays(BusinessHrHolidaysRetrieverConstants.BUSINESS_HR_PREFIX, content);        
        List<BusinessHours> bHrs = [SELECT WednesdayStartTime, WednesdayEndTime, TuesdayStartTime, TuesdayEndTime, TimeZoneSidKey, 
                                        ThursdayStartTime, ThursdayEndTime, SystemModstamp, SundayStartTime, SundayEndTime, SaturdayStartTime, 
                                        SaturdayEndTime, Name, MondayStartTime, MondayEndTime, LastModifiedDate, LastModifiedById, IsDefault, IsActive, 
                                        Id, FridayStartTime, FridayEndTime, CreatedDate, CreatedById 
                                    FROM BusinessHours WHERE Id IN :businessHrIds];
        return bHrs;
    }
    
    private static Set<String> retrieveBusinessHourHolidays(String keyPrefix, Blob content) {
            system.debug('String keyPrefix***********'+keyPrefix);
            system.debug('content***********'+content);
        
        Integer tableStartIndex = content.toString().indexOf(BusinessHrHolidaysRetrieverConstants.PAGE_BODY_CLASS);
            system.debug('tableStartIndex ***********'+tableStartIndex );
        String subStr = content.toString().substring(tableStartIndex);
            system.debug('subStr***********'+subStr);
        
        subStr = subStr.substring(subStr.indexOf(BusinessHrHolidaysRetrieverConstants.TABLE_ROW_END));
            system.debug('BusinessHrHolidaysRetrieverConstants.TABLE_ROW_END***********'+BusinessHrHolidaysRetrieverConstants.TABLE_ROW_END);
            
        String strWithBusinessHrHolidays = subStr.substring(subStr.indexOf(BusinessHrHolidaysRetrieverConstants.TABLE_HEADER_START));
        Set<String> recordIds = new Set<String>();
        while(strWithBusinessHrHolidays.contains(keyPrefix)) {
            String strWithRecordId = strWithBusinessHrHolidays.substring(strWithBusinessHrHolidays.indexOf(BusinessHrHolidaysRetrieverConstants.ANCHOR_TAG_START), strWithBusinessHrHolidays.indexOf(BusinessHrHolidaysRetrieverConstants.ANCHOR_TAG_END));
            String recordId = strWithRecordId.substring(strWithRecordId.indexOf(BusinessHrHolidaysRetrieverConstants.HREF_STRING) + BusinessHrHolidaysRetrieverConstants.HREF_STRING.length(),strWithRecordId.indexOf(BusinessHrHolidaysRetrieverConstants.CLOSING_TAG));
            String recordName = strWithRecordId.substring(strWithRecordId.indexOf(BusinessHrHolidaysRetrieverConstants.CLOSING_TAG) + BusinessHrHolidaysRetrieverConstants.CLOSING_TAG.length());
            if(!recordId.contains(BusinessHrHolidaysRetrieverConstants.ROWSPERPAGE)) {              
                recordIds.add(recordId);  
                System.debug(recordId);
                System.debug(recordName);            
            }   
            strWithBusinessHrHolidays = strWithBusinessHrHolidays.substring(strWithBusinessHrHolidays.indexOf(BusinessHrHolidaysRetrieverConstants.ANCHOR_TAG_END) + BusinessHrHolidaysRetrieverConstants.ANCHOR_TAG_END.length());
        }
        return recordIds;
    }
    
    public class InvalidDataException extends Exception {}
}