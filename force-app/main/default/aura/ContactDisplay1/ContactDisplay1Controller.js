({
	init : function(component, event, helper) {
        var action = component.get("c.getContactList");
        var recid = component.get("v.idvalue");
        
        action.setParams({ AId : recid });
        //action.setParams({ AId : "a0d3D000000SfAFQA0" });
         
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var Responsedata = response.getReturnValue(); 
                component.set("v.items", response.getReturnValue());
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
	},
    
    toggle: function(component, event, helper) {
        var items = component.get("v.items"), index = event.getSource().get("v.value");
        items[index].expanded = !items[index].expanded;
        component.set("v.items", items);
    }
})