global class VEmailProcess implements Messaging.InboundEmailHandler 
{
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope)
    {
       
    Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
    Messaging.InboundEmail.textAttachment[] tAttachments = email.TextAttachments;
    System.debug('Text Attachement from the email.' + tAttachments);
    Messaging.InboundEmail.BinaryAttachment[] bAttachments = email.BinaryAttachments;
    System.debug('Binary Attachement from the email.' + bAttachments);
    String csvbody = '';
    If(bAttachments != Null)
    {
        For(Messaging.InboundEmail.binaryAttachment btt : bAttachments)
        {
            System.debug('This is a Binary Attachement from the email parsed.'+ btt);
            If(btt.Filename.endsWith('.csv'))
            {
                //integer i=0;
                System.debug('Binay Attachment' + btt);
                csvbody = btt.body.toString();
                System.debug('Battachment Vivek ' + csvbody);
                system.debug('Ram');
                string b;
                string b1;
                string b2;
                string b3;
                string b4;
                String[] filelines = new String[]{};
                  filelines = csvbody.split('\n');
                for (Integer i=1;i<filelines.size();i++)
                {
                    String[] inputvalues = new String[]{};
                    inputvalues = filelines[i].split(',');
                     b= inputvalues[0];
                         b1= inputvalues[1];
                         b2= inputvalues[2];
                         b3= inputvalues[3];
                     b4= inputvalues[4];
                    system.debug(b);
                    system.debug(b1);
                    system.debug(b2);
                    system.debug(b3);
                
                 string acctid=email.subject;
                system.debug(acctid);
             	Account acct =new Account();
                acct= [Select Id,name,AccountNumber from Account where id=:acctid];////
                if(acct==null)
                {
               	 acct.Name='SFDC Account Alpana';  
                    insert acct;
                    acctid=acct.id;
                    system.debug('Account insert');
                }
       // Add a contact to this account.
        system.debug('Contact insert');
    	Contact con = new Contact(Salutation=b,FirstName=b1,LastName=b2,Phone=b3,Email=b4,AccountId=acctid);
    	insert con;
              string idd=con.id;
               
                system.debug(idd);
                }
               // integer s=b.length();
               // system.debug(s);
               // system.debug(b2);
                //system.debug(b3);
               //system.debug(b);
            }
        }
    }
    Else If(tAttachments != Null)
    {
        For(Messaging.InboundEmail.textAttachment ttt : tAttachments)
        {
            System.debug('This is a  Text Attachment from the email parsed.' + ttt);
            If(ttt.Filename.endsWith('.csv'))
            {
                System.debug('Text Attachment' + ttt);
                csvbody = ttt.body;
                System.debug('TXTAttachment' + csvbody);
            }
        }  
    }
    return result;
       
}


}