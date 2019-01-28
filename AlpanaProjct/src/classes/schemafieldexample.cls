public class schemafieldexample
{
  	public list<selectoption> options;
    public list<selectoption> getoptions()
    {
     return options; 
    }
    public schemafieldexample()
    {
        options=new list<selectoption>();
        schema.DescribeSObjectResult R=Account.sobjectType.getDescribe();
        list<schema.ChildRelationship> c=R.getChildRelationships();
        
        for(schema.ChildRelationship X:c)
        {
              string name=''+X.getChildsObject();
            selectoption op=new selectoption(name,name);
            options.add(op);
        }
    }
        
    
}