public class SendEmailSample {
public String emailTo {get; set;}
public String emailBody {get; set;}
public String response {get; set;}

public SendEmailSample(){
    emailTo = Apexpages.currentPage().getParameters().get('MyVariable');
}
 
public PageReference sendEmail(){
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
mail.setToAddresses(new String[] {emailTo});
mail.setReplyTo('noreply@yourcompany.com');
mail.setSenderDisplayName('Your Company Name');
mail.setSubject('Test Email From Force.com Sites');
mail.setPlainTextBody(emailBody);
try{
Messaging.SendEmailResult[] resultMail = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
if(resultMail[0].isSuccess())      
response = 'ok sent!';
else{
response = resultMail[0].getErrors().get(0).getMessage();
}

}catch(System.EmailException ex){
response = ex.getMessage();

}  

return null;

}
}