package Validation;
import java.sql.*;
import javax.ejb.*;
@Stateful
public class LoginBean implements Login
{
    @EJB DataBase bean;
    String user,result="not_found";
    @Override
    public String checkLogin(String un, String pd)
    {
        try(Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM CLIENT")){
            while(rs.next())
            {
                if(un.equals(rs.getString("USER_NAME")))
                {
                    if(pd.equals(rs.getString("PASSWORD")))
                    {result = "logged";}
                    else
                    {result = "unautherized";}
                }
            }
            rs.close();
            st.close();
        }
        catch (Exception ex){
            System.out.println(ex);
        }
        return result;
    }
    @Override
    public String getUser(String un)
    {
        try(Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM CLIENT")){
            while(rs.next())
            {
                if(un.equals(rs.getString("USER_NAME")))
                {
                    String first=rs.getString("FIRST_NAME");
                    String middle=rs.getString("MIDDLE_NAME");
                    String last=rs.getString("LAST_NAME");
                    if(middle==null)
                    {
                        user=first+" "+last;
                    }
                    else
                    {
                        user=first+" "+middle+" "+last;
                    }
                }
            }
            rs.close();
            st.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }
        return user;
    }
}
