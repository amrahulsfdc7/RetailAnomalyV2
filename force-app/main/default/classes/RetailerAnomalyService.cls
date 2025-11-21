public class RetailerAnomalyService {
    public static void process(TxnSecurity.Event e){
        User u=[SELECT Id,Email,Name FROM User WHERE Id=:e.userId LIMIT 1];
        Messaging.SingleEmailMessage m=new Messaging.SingleEmailMessage();
        m.setToAddresses(new String[]{u.Email});
        m.setSubject('Security Alert: Suspicious Login Detected');
        m.setPlainTextBody('Hello '+u.Name+',\nA suspicious login was detected.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{m});
    }
}
