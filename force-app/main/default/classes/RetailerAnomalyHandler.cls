global class RetailerAnomalyHandler implements TxnSecurity.EventHandler {
    global TxnSecurity.EventResponse handleEvent(TxnSecurity.Event e) {
        TxnSecurity.EventResponse res = new TxnSecurity.EventResponse();
        RetailerAnomalyService.process(e);
        return res;
    }
}
