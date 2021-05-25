/********************************************************************************************************************************
Apex class         : <WCT_ExceptionUtility>
Description        : <Global class in which can log exceptions ad retrieve logged exceptions>
Type               :  Global Class
Test Class         : <Test_WCT_ExpUtility>

*Version         Developer                   Date          Code Coverage              Case/Req #                           Description     
* ------------------------------------------------------------------------------------------------------------------------------------------------            
* 01             Deloitte                 26/05/2016          100%                          --                            License Cleanup Project
************************************************************************************************************************************/   

global class WCT_ExceptionUtility{

   /********************************************************************************************
    *Method Name         : <logException>
    *Return Type         : <Object>
    *Param’s             : className,pageName,exceptionMessage
    *Description         : <logException() Used to log exceptions occured in try blocks>
    
    *Version          Description
    * -----------------------------------------------------------------------------------------------------------                 
    * 01              Original Version
    ************************************************************************************************/          
    
    
    public static Exception_Log__c logException(string className, string pageName, string exceptionMessage){
        
        
        //holds the record type id of exception object to log the failures.
        Schema.DescribeSObjectResult Cas1 = Exception_Log__c.SObjectType.getDescribe();// getting Sobject Type
        Map<String,Schema.RecordTypeInfo> rtMapByNames1 = Cas1.getRecordTypeInfosByName();// getting the record Type Info
        Id exceptionid =rtMapByNames1.get('Exception').getRecordTypeId();//particular RecordId by  Name
        
        Exception_Log__c exc= new Exception_Log__c();
        exc.className__c = className;
        exc.pageName__c = pageName;
        exc.Detailed_Exception__c = exceptionMessage;
        exc.Exception_Date_and_Time__c = system.now();
        exc.Running_User__c = UserInfo.getUserId();
        exc.RecordtypeId=exceptionid;
        insert exc;
        exc = [SELECT Id,Name from Exception_Log__c where Id =: exc.Id];
        return exc;
        
    }
    
    
   /********************************************************************************************
    *Method Name         : <returnExcLog>
    *Return Type         : <Object>
    *Param’s             : className,pageName,exceptionMessage
    *Description         : <returnExcLog() Used to retrieve logged exceptions occured in try blocks>
    
    *Version          Description
    * -----------------------------------------------------------------------------------------------------------                 
    * 01              Original Version
    ************************************************************************************************/       
    
    public static Exception_Log__c returnExcLog(string className, string pageName, string exceptionMessage){
         
        //holds the record type id of exception object to log the failures.
        Schema.DescribeSObjectResult Cas1 = Exception_Log__c.SObjectType.getDescribe();// getting Sobject Type
        Map<String,Schema.RecordTypeInfo> rtMapByNames1 = Cas1.getRecordTypeInfosByName();// getting the record Type Info
        Id exceptionid =rtMapByNames1.get('Exception').getRecordTypeId();//particular RecordId by  Name
        Exception_Log__c exc= new Exception_Log__c();
        exc.className__c = className;
        exc.pageName__c = pageName;
        exc.Detailed_Exception__c = exceptionMessage;
        exc.Exception_Date_and_Time__c = system.now();
        exc.Running_User__c = UserInfo.getUserId();
        exc.recordtypeid=  exceptionid;
        return exc; 
    }
   
}