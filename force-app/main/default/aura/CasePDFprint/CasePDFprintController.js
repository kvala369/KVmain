({
    toPDFFormat : function(component, event, helper) {
        /*
        alert('entered');
        var margins = { top: 10, bottom: 10, left: 10, width: 600 };
        alert('margins--'+margins);
        var pdf = new jsPDF('p', 'pt', 'letter');
        pdf.internal.scaleFactor = 2.25;
        pdf.addHTML(document.body,{pagesplit:true, background: '#fff', javascriptEnabled : true},function(){
            console.log(src);
            pdf.output('dataurlnewwindow');
        });
        */
        //pdf.text(10,10,'yay pdf');
        
        var doc = new jsPDF();
        var specialElementHandlers = {
            '#editor': function (element, renderer) {
                return true;
            }
        };
        
        $('#cmd').click(function () {   
            doc.fromHTML($('#content').html(), 15, 15, {
                'width': 170,
                'elementHandlers': specialElementHandlers
            });
            doc.save('sample-file.pdf');
        });
        
    }
})