package Validation;
import java.sql.*;
import javax.ejb.*;
@Stateless
public class DataBean implements Data
{
    @EJB DataBase bean;
    String email,birth,address1,address2,city,state,landline,mobile;
    @Override
    public String getEmail(String usr)
    {
        
        try(Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM CLIENT")){
            while(rs.next())
            {
                if(usr.equals(rs.getString("USER_NAME")))
                {
                    email=rs.getString("EMAIL_ADDRESS");
                }
            }
            rs.close();
            st.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }
        return email;
    }
    @Override
    public String getBirth(String usr)
    {
        try(Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM CLIENT")){
            while(rs.next())
            {
                if(usr.equals(rs.getString("USER_NAME")))
                {
                    birth=rs.getDate("DATE_OF_BIRTH").toString();
                }
            }
            rs.close();
            st.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }
        return birth;
    }
    @Override
    public String getAddress1(String usr)
    {
        try(Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM CLIENT")){
            while(rs.next())
            {
                if(usr.equals(rs.getString("USER_NAME")))
                {
                    address1=rs.getString("ADDRESS_1");
                }
            }
            rs.close();
            st.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }
        return address1;
    }
    @Override
    public String getAddress2(String usr)
    {
        try(Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM CLIENT")){
            while(rs.next())
            {
                if(usr.equals(rs.getString("USER_NAME")))
                {
                    address2=rs.getString("ADDRESS_2");
                }
            }
            rs.close();
            st.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }
        return address2;
    }
    @Override
    public String getCity(String usr)
    {
        try(Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM CLIENT")){
            while(rs.next())
            {
                if(usr.equals(rs.getString("USER_NAME")))
                {
                    city=rs.getString("CITY");
                }
            }
            rs.close();
            st.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }
        return city;
    }
    @Override
    public String getState(String usr)
    {
        try(Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM CLIENT")){
            while(rs.next())
            {
                if(usr.equals(rs.getString("USER_NAME")))
                {
                    state=rs.getString("STATE");
                }
            }
            rs.close();
            st.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }
        return state;
    }
    @Override
    public String getLandline(String usr)
    {
        try(Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM CLIENT")){
            while(rs.next())
            {
                if(usr.equals(rs.getString("USER_NAME")))
                {
                    landline=rs.getString("LANDLINE_NO");
                }
            }
            rs.close();
            st.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }
        return landline;
    }
    @Override
    public String getMobile(String usr)
    {
        try(Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM CLIENT")){
            while(rs.next())
            {
                if(usr.equals(rs.getString("USER_NAME")))
                {
                    mobile=rs.getString("MOBILE_NO");
                }
            }
            rs.close();
            st.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }
        return mobile;
    }
}