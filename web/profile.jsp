<%@ include file="header.jsp" %>
<%@ page import="Validation.Data, javax.naming.*" %>
<%! Data data;%>
<%
try {
    Context context=new InitialContext();
    data=(Data)context.lookup(Data.class.getName());
    String usr=(String)session.getAttribute("usrid");
%>
<script type="text/javascript">
    function checkpass()
    {
        if(document.pass.cpass.value==="")
        {
            alert( "You must enter your current password.\n");
            return false;
        }
        if(document.pass.pass1.value==="")
        {
            alert( "You must enter a new password.\n");
            return false;
        }
        if(document.pass.pass1.value!==document.pass.pass2.value)
        {
            alert( "You must reenter correctly your password.\n");
            return false;
        }
    }
    function checkprofile()
    {
        if(document.profile.cpass.value==="")
        {
            alert( "You must enter your current password.\n");
            return false;
        }
        if(document.profile.address1.value==="")
        {
            alert( "You must enter atleast 1 address.\n");
            return false;
        }
        if(document.profile.city.value==="")
        {
            alert( "You must enter your city.\n");
            return false;
        }
        if(document.profile.mobile.value==="")
        {
            alert( "You must enter your mobile no.\n");
            return false;
        }
    }
</script>
<h1>Profile</h1>
<h2>Information which can't update</h2>
<table>
    <thead>
        <tr><td>Name: </td>
            <td><%=session.getAttribute("user")%></td></tr>
        <tr><td>E-mail: </td>
            <td><%=data.getEmail(usr)%></td></tr>
        <tr><td>Date of Birth: </td>
            <td><%=data.getBirth(usr)%></td></tr>
    </thead>
</table><hr/>
<%if(session.getAttribute("password")==null)
{%><h2>Change your password</h2><%}
else if(session.getAttribute("password").equals("success"))
{%><div class="good">Your password change successfully!</div><%}
else if(session.getAttribute("password").equals("fail"))
{%><div class="error">You entered incorrect password!</div><%}%>
<form name="pass" method="post" action="update.jsp" onsubmit="return checkpass()">
<input type="hidden" value="password" name="value">
<table>
	<tr>
		<td>*Current Password</td>
		<td><input type="password" name="cpass"/></td>
	</tr>
        <tr>
		<td>*Enter new Password</td>
		<td><input type="password" name="pass1"/></td>
	</tr>
	<tr>
		<td>*Reenter Password</td>
		<td><input type="password" name="pass2"/></td>
	</tr>
</table>
    <input type="submit" value="Change">
    <input type="reset" value="Reset">
</form><hr/>
<%if(session.getAttribute("profile")==null)
{%><h2>Change your profile</h2><%}
else if(session.getAttribute("profile").equals("success"))
{%><div class="good">Your profile change successfully!</div><%}
else if(session.getAttribute("profile").equals("fail"))
{%><div class="error">You entered incorrect password!</div><%}%>
<form name="profile" method="post" action="update.jsp" onsubmit="return checkprofile()">
<input type="hidden" value="account" name="value">
<table>
        <tr>
		<td>*Current Password</td>
		<td><input type="password" name="cpass"/></td>
	</tr>
	<tr>
		<td>*Address 1</td>
                <td><input type="text" name="address1"  value="<%=data.getAddress1(usr)==null?"":data.getAddress1(usr)%>"/></td>
	</tr>
        <tr>
		<td>Address 2</td>
		<td><input type="text" name="address2"  value="<%=data.getAddress2(usr)==null?"":data.getAddress2(usr)%>"/></td>
	</tr>
	<tr>
		<td>*City</td>
		<td><input type="text" name="city"  value="<%=data.getCity(usr)==null?"":data.getCity(usr)%>"/></td>
	</tr>
        <tr>
		<td>*State</td>
		<td><select name="state">
                        <%String state=data.getState(usr);%>
                        <option value="Andaman and Nicobar Islands" <%=state.equals("Andaman and Nicobar Islands")?"selected":""%>>Andaman and Nicobar Islands</option>
  			<option value="Andra Pradesh" <%=state.equals("Andra Pradesh")?"selected":""%>>Andra Pradesh</option>
  			<option value="Arunachal Pradesh" <%=state.equals("Arunachal Pradesh")?"selected":""%>>Arunachal Pradesh</option>
  			<option value="Assam" <%=state.equals("Assam")?"selected":""%>>Assam</option>
			<option value="Bihar" <%=state.equals("Bihar")?"selected":""%>>Bihar</option>
			<option value="Chandigarh" <%=state.equals("Chandigarh")?"selected":""%>>Chandigarh</option>
			<option value="Chhattisgarh" <%=state.equals("Chhattisgarh")?"selected":""%>>Chhattisgarh</option>
			<option value="Dadar and Nagar Haveli" <%=state.equals("Dadar and Nagar Haveli")?"selected":""%>>Dadar and Nagar Haveli</option>
			<option value="Daman and Diu" <%=state.equals("Daman and Diu")?"selected":""%>>Daman and Diu</option>
			<option value="Delhi" <%=state.equals("Delhi")?"selected":""%>>Delhi</option>
			<option value="Goa" <%=state.equals("Goa")?"selected":""%>>Goa</option>
			<option value="Gujarat" <%=state.equals("Gujarat")?"selected":""%>>Gujarat</option>
			<option value="Haryana" <%=state.equals("Haryana")?"selected":""%>>Haryana</option>
			<option value="Himachal Pradesh" <%=state.equals("Himachal Pradesh")?"selected":""%>>Himachal Pradesh</option>
			<option value="Jammu and Kashmir" <%=state.equals("Jammu and Kashmir")?"selected":""%>>Jammu and Kashmir</option>
			<option value="Jharkhand" <%=state.equals("Jharkhand")?"selected":""%>>Jharkhand</option>
			<option value="Karnataka" <%=state.equals("Karnataka")?"selected":""%>>Karnataka</option>
			<option value="Kerala" <%=state.equals("Kerala")?"selected":""%>>Kerala</option>
			<option value="Lakshadeep" <%=state.equals("Lakshadeep")?"selected":""%>>Lakshadeep</option>
			<option value="Madya Pradesh" <%=state.equals("Madya Pradesh")?"selected":""%>>Madya Pradesh</option>
			<option value="Maharashtra" <%=state.equals("Maharashtra")?"selected":""%>>Maharashtra</option>
			<option value="Manipur" <%=state.equals("Manipur")?"selected":""%>>Manipur</option>
			<option value="Meghalaya" <%=state.equals("Meghalaya")?"selected":""%>>Meghalaya</option>
			<option value="Mizoram" <%=state.equals("Mizoram")?"selected":""%>>Mizoram</option>
			<option value="Nagaland" <%=state.equals("Nagaland")?"selected":""%>>Nagaland</option>
			<option value="Orissa" <%=state.equals("Orissa")?"selected":""%>>Orissa</option>
			<option value="Pondicherry" <%=state.equals("Pondicherry")?"selected":""%>>Pondicherry</option>
			<option value="Punjab" <%=state.equals("Punjab")?"selected":""%>>Punjab</option>
			<option value="Rajasthan" <%=state.equals("Rajasthan")?"selected":""%>>Rajasthan</option>
			<option value="Sikkim" <%=state.equals("Sikkim")?"selected":""%>>Sikkim</option>
			<option value="Tamil Nadu" <%=state.equals("Tamil Nadu")?"selected":""%>>Tamil Nadu</option>
			<option value="Tripura" <%=state.equals("Tripura")?"selected":""%>>Tripura</option>
			<option value="Uttaranchal" <%=state.equals("Uttaranchal")?"selected":""%>>Uttaranchal</option>
			<option value="Uttar Pradesh" <%=state.equals("Uttar Prades")?"selected":""%>>Uttar Pradesh</option>
			<option value="West Bengal" <%=state.equals("West Bengal")?"selected":""%>>West Bengal</option>
                    </select></td>
	</tr>
	<tr>
		<td>Landline no</td>
		<td><input type="text" name="landline"  value="<%=data.getLandline(usr)==null?"":data.getLandline(usr)%>"/></td>
	</tr>
        <tr>
		<td>*Mobile no</td>
		<td><input id="mobile" type="text" name="mobile"  value="<%=data.getMobile(usr)==null?"":data.getMobile(usr)%>" /></td>
	</tr>
</table>
    <input type="submit" value="Update">
    <input type="reset" value="Reset">
</form>

<div id="note">
<p>Notes </p>	 
<ul>
	<li>Those payee are register under your account.</li>
	<li>When you delete a payee it is still recorded in your Activities.</li>
</ul>
 </div>
<%}
catch(Exception e)
{out.println(e.toString());}%>
<%@include file="footer.jsp" %>