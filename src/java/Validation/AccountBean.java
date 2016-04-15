package Validation;
import java.sql.*;
import javax.ejb.*;
@Stateless
public class AccountBean implements Account
{
    @EJB DataBase bean;
    long account=0,amount=0;
    String acctype=null;
    @Override
    public long getAccount(String usr,int i)
    {
        
        try (Statement st = bean.getConnection().createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM CLIENT_INFO")) {
            while(rs.next()){
                if(usr.equals(rs.getString("USER_NAME")))
                    account=rs.getLong("ACCOUNT_"+i);
            }
        }
        catch (SQLException ex){
            System.out.println(ex);
        }
        return account;
    }
    @Override
    public double getAmount(String usr,int i)
    {
        try (Statement st = bean.getConnection().createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM CLIENT_INFO")) {
            while(rs.next()){
                if(usr.equals(rs.getString("USER_NAME")))
                    amount=rs.getLong("AMOUNT_"+i);
            }
        }
        catch (SQLException ex)
        {
            System.out.println(ex);
        }
        return amount;
    }
    @Override
    public String getAccountType(String usr,int i)
    {
        
        try (Statement st = bean.getConnection().createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM CLIENT_INFO")) {
            while(rs.next()){
                if(usr.equals(rs.getString("USER_NAME")))
                    acctype=rs.getString("ACC_TYPE_"+i);
            }
        }
        catch (SQLException ex){
            System.out.println(ex);
        }
        return acctype;
    }
}