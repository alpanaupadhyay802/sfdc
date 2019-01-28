public class DescribeExample
{
    public list <selectoption> options;
    public list <selectoption> getoptions()
    {
        return options;
    }
    public DescribeExample()
    {
        options=new list <selectoption>();
        map<string,schema.SObjectType> m=schema.getGlobalDescribe();
        set<string> obj=m.keySet();
        for (string s:obj)
        {
            selectoption op=new selectoption(s,s);
            options.add(op);
        }
    }
    
    
}