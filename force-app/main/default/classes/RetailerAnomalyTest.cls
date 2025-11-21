@IsTest
private class RetailerAnomalyTest {
    @IsTest static void testHandler(){
        User u=new User(LastName='T',Email='t'+System.currentTimeMillis()+'@e.com',
            Username='t'+System.currentTimeMillis()+'@e.com',Alias='t',
            TimeZoneSidKey='Asia/Kolkata',LocaleSidKey='en_US',
            EmailEncodingKey='UTF-8',
            ProfileId=[SELECT Id FROM Profile WHERE Name='Standard User' LIMIT 1].Id,
            LanguageLocaleKey='en_US');
        insert u;
        TxnSecurity.Event ev=(TxnSecurity.Event)JSON.deserialize(
            '{"userId":"'+u.Id+'","eventType":"Login","policyName":"Test"}',
            TxnSecurity.Event.class);
        RetailerAnomalyHandler h=new RetailerAnomalyHandler();
        TxnSecurity.EventResponse r=h.handleEvent(ev);
    }
}
