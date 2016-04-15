package Validation;
import java.sql.*;
import javax.ejb.*;
@Singleton
public class UpdateBean implements Update
{
    @EJB DataBase bean;
    @Override
    public void upPhone(String usr,String landline,String mobile)
    {
        try
        {
            Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM CLIENT");
            while(rs.next())
            {
                if(usr.equals(rs.getString("USER_NAME")))
                {
                    if(landline==null)
                        st.executeUpdate("UPDATE CLIENT SET MOBILE_NO='"+mobile+"' WHERE USER_NAME='"+usr+"'");
                    else
                        st.executeUpdate("UPDATE CLIENT SET LANDLINE_NO='"+landline+"'MOBILE_NO='"+mobile+"' WHERE USER_NAME='"+usr+"'");
                 }
            }
            rs.close();
            st.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }
    }
    @Override
    public String upPassword(String usr,String cpass,String npass)
    {
        String result=null;
        try
        {
            Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM CLIENT");
            while(rs.next())
            {
                if(usr.equals(rs.getString("USER_NAME")))
                {
                    if(cpass.equals(rs.getString("PASSWORD")))
                    {
                        st.executeUpdate("UPDATE CLIENT SET PASSWORD='"+npass+"' WHERE USER_NAME='"+usr+"'");
                        result="success";
                    }
                    else
                        result="fail";
                }
            }
            rs.close();
            st.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }
        return result;
    }
    @Override
    public String upAddress(String usr, String cpass, String adrs1, String adrs2, String city, String state)
    {
        String result=null;
        try
        {
            Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM CLIENT");
            while(rs.next())
            {
                if(usr.equals(rs.getString("USER_NAME")))
                {
                    if(cpass.equals(rs.getString("PASSWORD")))
                    {
                        if(adrs2==null)
                            st.executeUpdate("UPDATE CLIENT SET ADDRESS_1='"+adrs1+"', CITY='"+city+"', STATE='"+state+"' WHERE USER_NAME='"+usr+"'");
                        else
                            st.executeUpdate("UPDATE CLIENT SET ADDRESS_1='"+adrs1+"', ADDRESS_2='"+adrs2+"', CITY='"+city+"', STATE='"+state+"' WHERE USER_NAME='"+usr+"'");
                        result="success";
                    }
                    else
                        result="fail";
                }
            }
            rs.close();
            st.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }
        return result;
    }

}