package Validation;
import javax.ejb.Remote;
@Remote
public interface Account
{
    public long getAccount(String usr,int i);
    public double getAmount(String usr,int i);
    public String getAccountType(String usr,int i);
}