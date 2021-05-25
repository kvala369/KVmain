({
	doInit : function(component, event, helper) {
		
        var testid = component.get("v.recordId");
        
       /* action.setParams({
	        "userRecordId" : testid
	    });
        alert(userRecordId);
        */
        var action = component.get("c.getContactList");
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
            	//alert('succes');
                var succesData = response.getReturnValue();
                //alert('succesData is '+JSON.stringify(succesData));
                component.set("v.data", succesData);
                //component.set("v.data", [{expanded: false}]);
                
                component.set("v.datalength", succesData.length);
                
                
            }
        });
        
        $A.enqueueAction(action);
    },
    
        
    toggle : function(component, event, helper) {
        var toggleText = component.find("text");
        $A.util.toggleClass(toggleText, "toggle");
    }
})