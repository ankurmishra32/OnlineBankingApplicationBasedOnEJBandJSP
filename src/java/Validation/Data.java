package Validation;
import javax.ejb.Remote;
@Remote
public interface Data
{
    public String getEmail(String usr);
    public String getBirth(String usr);
    public String getAddress1(String usr);
    public String getAddress2(String usr);
    public String getCity(String usr);
    public String getState(String usr);
    public String getLandline(String usr);
    public String getMobile(String usr);
}