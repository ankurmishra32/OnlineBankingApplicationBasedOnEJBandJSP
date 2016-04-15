package Validation;
import java.sql.*;
import javax.ejb.*;
@Stateful
@LocalBean
public class DataBase
{
    public Connection getConnection()
    {
        Connection cn=null;
        try
        {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            cn=DriverManager.getConnection("jdbc:odbc:BankApp");
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return cn;
    }
}
