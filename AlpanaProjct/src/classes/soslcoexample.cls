public class soslcoexample 

{

    public string SearchQuery{get;set;}
    public list <Lead> leadlist{get;set;}
    public list <Contact> conlist{get;set;}
    public list <Account> acclist{get;set;}
    public list <Opportunity> optylist{get;set;}
    
    public void setSearchQuery(string SearchQuery)
		{
		this.SearchQuery=SearchQuery;
		}
    public  soslcoexample()
    {
        
    }
public void sosldemo_method()
{
   
   leadlist=New list<Lead>();
   conlist=New list <Contact>();
   acclist=New list <Account>();
   optylist=New list <Opportunity>();
    list<list<sobject>> searchlist = [FIND :SearchQuery IN ALL FIELDS RETURNING Account(Name,Type),Contact(name,email),lead(Company,name,Status),Opportunity(Id,name)];
 
  leadlist=((list<Lead>)searchlist[2]);
  conlist=((list<Contact>)searchlist[1]);    
  acclist=((list<Account>)searchlist[0]);  
  optylist=((list<Opportunity>)searchlist[3]);
}
}