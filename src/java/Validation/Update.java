package Validation;
import javax.ejb.Remote;
@Remote
public interface Update
{
    public void upPhone(String usr,String landline,String mobile);
    public String upPassword(String usr,String cpass,String npass);
    public String upAddress(String usr,String cpass,String adrs1,String adrs2, String city, String state);
}
