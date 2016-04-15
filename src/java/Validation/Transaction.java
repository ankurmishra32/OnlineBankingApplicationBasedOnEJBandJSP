package Validation;
import javax.ejb.Remote;
@Remote
public interface Transaction
{
    public String checkAccount(long account);
    public String transferTo(String usr, long usracc, double money);
    public String transferFrom(String usr, long usracc, double money);
    public String viewSender(String usr, long usracc, long sendracc, double money);
    public String viewReciver(String usr, long usracc, long recivracc, double money);
}