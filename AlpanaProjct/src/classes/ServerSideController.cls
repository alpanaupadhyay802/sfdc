public with sharing class ServerSideController {

    //Use @AuraEnabled to enable client- and server-side access to the method
    @AuraEnabled
    public static String serverEcho(String firstName)
    {
        return ('Hello from the server, ' + firstName);
    }
}