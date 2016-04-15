package Validation;
import java.sql.*;
import javax.ejb.*;
import java.util.Date;
@Singleton
public class TransactionBean implements Transaction
{
    @EJB DataBase bean;
    Date longdate=new Date();
    String date=longdate.toString();
    String day=date.substring(7,11);
    String month=date.substring(4,7);
    String year=date.substring((date.length())-3);
    String time=day+"-"+month+"-"+year;
    String usr,result="fail";
    @Override
    public String checkAccount(long account)
    {
        try
        {
            Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM CLIENT_INFO");
            while(rs.next())
            {
                for(int i=1;i<=3;i++)
                {
                    if(account==rs.getLong("ACCOUNT_"+i))
                        usr=rs.getString("USER_NAME");
                }
            }
            rs.close();
            st.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }
        return usr;
    }
    @Override
    public String transferTo(String usr, long usracc, double money)
    {
        if(money<0)
        {
            return result;
        }
        try
        {
            Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM CLIENT_INFO WHERE USER_NAME='"+usr+"'");
            while(rs.next())
            {
                for(int i=1;i<=3;i++)
                {
                    if(usracc==rs.getLong("ACCOUNT_"+i))
                    {
                        double balance=rs.getLong("AMOUNT_"+i)+money;
                        st.executeUpdate("UPDATE CLIENT_INFO SET AMOUNT_"+i+"="+balance+" WHERE USER_NAME='"+usr+"'");
                        result="success";
                        break;
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
        return result;
    }
    @Override
    public String transferFrom(String usr, long usracc, double money)
    {
        try
        {
            Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM CLIENT_INFO WHERE USER_NAME='"+usr+"'");
            while(rs.next())
            {
                for(int i=1;i<=3;i++)
                {
                    if(usracc==rs.getLong("ACCOUNT_"+i))
                    {
                        double balance=rs.getLong("AMOUNT_"+i)-money;
                        st.executeUpdate("UPDATE CLIENT_INFO SET AMOUNT_"+i+"="+balance+" WHERE USER_NAME='"+usr+"'");
                        result="success";
                        break;
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
        return result;
    }
    @Override
    public String viewSender(String usr, long usracc, long sendracc, double money)
    {
        try
        {
            Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM TRANSACTION");
            rs.next();
            st.executeUpdate("INSERT INTO TRANSACTION(USER_NAME,USER_ACCOUNT,RECEIVE_ACCOUNT,RECEIVE_AMOUNT,DATE_OF_TRANSACTION) VALUES('"+usr+"',"+usracc+","+sendracc+","+money+",'"+time+"')");
            result="success";
            rs.close();
            st.close();
        }
        catch (SQLException ex)
        {
            System.out.println(ex);
        }
        return result;
    }
    @Override
    public String viewReciver(String usr, long usracc, long recivracc, double money)
    {
        try
        {
            Statement st=bean.getConnection().createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM TRANSACTION");
            rs.next();
            st.executeUpdate("INSERT INTO TRANSACTION(USER_NAME,USER_ACCOUNT,TRANSFER_ACCOUNT,TRANSFER_AMOUNT,DATE_OF_TRANSACTION) VALUES('"+usr+"',"+usracc+","+recivracc+","+money+",'"+time+"')");
            result="success";
            rs.close();
            st.close();
        }
        catch (SQLException ex)
        {
            System.out.println(ex);
        }
        return result;
    }
}