({
	myAction : function(component, event, helper) {
        
        
        var action = component.get("c.getcaserecords");
		action.setParams({ RecId : "50090000011qt3dAAA" });
		//alert('action--'+action);
        action.setCallback(this, function(response){
            var state = response.getState();
            //alert(state);
            if (state === "SUCCESS") {
                
                var Responsedata = response.getReturnValue(); 
                //alert('Responsedata--'+JSON.stringify(Responsedata));
                component.set("v.recval", response.getReturnValue());
                component.set("v.caserec", response.getReturnValue());
            }
            else if (response.getState() === "ERROR") {
                alert("error");
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        component.set("v.errorMsg", errors[0].message );
                    }
                }else {
                    component.set("v.errorMsg", 'Request Failed!' );
                }
            }   
            
        });
        $A.enqueueAction(action); 
	}
    
})