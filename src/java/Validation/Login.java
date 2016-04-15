package Validation;
import javax.ejb.Remote;
@Remote
public interface Login
{
public String checkLogin(String un, String pd);
public String getUser(String usr);
}
