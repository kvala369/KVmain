public without sharing class BusinessHrHolidaysRetrieverConstants {
    public static final String HOLIDAY_PREFIX = Holiday.sObjectType.getDescribe().getKeyPrefix();
    public static final String BUSINESS_HR_PREFIX = BusinessHours.sObjectType.getDescribe().getKeyPrefix();
    public static final Integer MAX_NUMBER_OF_HOLIDAYS = 100;
    public static final Integer MAX_NUMBER_OF_BUSINESS_HRS = 100;
    public static final String HOLIDAY_URL_PREFIX = '/' + HOLIDAY_PREFIX  + '?t=b&rowsperpage=' + MAX_NUMBER_OF_HOLIDAYS + '&id='; 
    public static final String BUSINESS_HR_URL_PREFIX = '/' + BUSINESS_HR_PREFIX  + '?t=b&rowsperpage=' + MAX_NUMBER_OF_BUSINESS_HRS + '&id=';  
    public static final String PAGE_BODY_CLASS = 'pbBody';
    public static final String TABLE_ROW_END = '</tr>';
    public static final String TABLE_HEADER_START = '<th';
    public static final String ANCHOR_TAG_START = '<a';
    public static final String ANCHOR_TAG_END = '</a>';
    public static final String HREF_STRING = 'href="/';
    public static final String CLOSING_TAG = '">';
    public static final String ROWSPERPAGE = 'rowsperpage';
    public static final String BLOB_CONTENT_FOR_HOLIDAY_TEST = '<div class="pbBody"><table ><tbody><tr ></tr><tr ><th ><a href="/0C028000000Tf4p">Republic Day</a></th><td >&nbsp;</td><td >26/01/2016&nbsp;All Day</td></tr></tbody></table></div>';
}