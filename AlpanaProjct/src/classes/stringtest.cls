public class stringtest 
{
    public static void main()
    {
string sbody='asssdfffgg!*&aa&9sssss';
       
    integer a = sbody.charAt(0);
    integer d = sbody.lastIndexOf('&');
        integer d1 =  sbody.lastIndexof('s');
        string sd=sbody.substring(9);
        string sd1=sbody.substringBetween('*','9');
        string sd2=sbody.substringBeforeLast('s');
     system.debug(a);  
        system.debug(d);  
        system.debug(d1);  
                                          system.debug(sd);
                                          system.debug(sd1);
                                          system.debug(sd2);
    }
}