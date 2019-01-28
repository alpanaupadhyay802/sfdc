public class insertact 
{
    public static void main(string acctid)
    {
try {
    
    //0017F00001aFzmu
    Account acct = [Select Id,name,AccountNumber from Account where Id=:acctid];
    if(acct==null)
    {
    new Account(Name='SFDC Account Alpana');
    insert acct;
    }

    // Add a contact to this account.
    Contact con = new Contact(
        FirstName='Joe',
        LastName='Smith',
        Phone='415.555.1212',
        AccountId=acct.id);
    insert con;
} 
    
        catch(DmlException e) {
    System.debug('An unexpected error has occurred: ' + e.getMessage());
}
}
}