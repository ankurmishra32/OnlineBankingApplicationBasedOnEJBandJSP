<%@include file="header.jsp" %>
<%@page import="java.text.*,java.sql.*, javax.naming.*, Validation.Account"%>
<%!Account account; int select=0; long acc=0;%>
<%
try
{
    String usr=(String)session.getAttribute("usrid");
    Context context=new InitialContext();
    account=(Account)context.lookup(Account.class.getName());
%>

<h1>Account Details</h1>
<select name="Id" id="Id" onChange="location.href='detail.jsp?account='+this.value;">
    <%for(int i=1;i<=3;i++){%>
    <option value="<%=account.getAccount(usr, i)%>"
            <%if(Long.parseLong(request.getParameter("account"))==account.getAccount(usr, i)){select=i;%> selected<%}%>>
        <%=account.getAccountType(usr, i)==null?"":account.getAccountType(usr, i)%><%=account.getAccount(usr, i)==0?"":"- "+account.getAccount(usr, i)%>
    </option><%}%>
</select>
<%acc=account.getAccount(usr, select);%>
<h2>Account</h2>
<table id="accsumm">
<thead>
	<tr>
		<td>Account Type</td>
		<td>Account Number</td>
		<td>Balance CAD</td>
	</tr>
</thead>
<tbody>
	<tr>
		<td><%=account.getAccountType(usr, select)==null?"":account.getAccountType(usr, select)%></td>
		<td><%=account.getAccount(usr, select)==0?"":account.getAccount(usr, select)%></td>
		<td><%=account.getAccount(usr, select)==0?"":account.getAmount(usr, select)%></td>
	</tr>
</tbody>
</table>
                <h2>Transaction Details</h2>
<table id="accsumm">
<thead>
	<tr>
		<td>Received Account</td>
		<td>Received Amount</td>
		<td>Transfer Account</td>
		<td>Transfer Amount</td>
		<td>Date of Transaction</td>
	</tr>
</thead>
<tbody>
<%
try
{
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    Connection cn=DriverManager.getConnection("jdbc:odbc:BankApp");
    Statement st=cn.createStatement();
    ResultSet rs=st.executeQuery("SELECT * FROM TRANSACTION WHERE USER_NAME='"+usr+"' AND USER_ACCOUNT="+acc+"");
    while(rs.next()){%>
    <tr>
        <td><%=rs.getLong("RECEIVE_ACCOUNT")%></td>
        <td><%=rs.getDouble("RECEIVE_AMOUNT")%></td>
        <td><%=rs.getLong("TRANSFER_ACCOUNT")%></td>
        <td><%=rs.getDouble("TRANSFER_AMOUNT")%></td>
        <td><%=rs.getDate("DATE_OF_TRANSACTION")%></td>
    </tr>
<%}
    rs.close();
    st.close();
}
catch (Exception ex)
{
    System.out.println(ex);
}
%>
</tbody>
</table>

<div id="note">
<p>Notes</p>
<ul>
	<li>All currency is in Canadian dollars!</li>
	<li>Navigate to your other accounts within the drop down box above.</li>	
	<li>The date shown will be the date when the money is being sent!</li>
	<li>Overdraft money is not shown!</li>
</ul>
</div>
<%}
catch(Exception e)
{
out.println(e.toString());
}
%>
<%@include file="footer.jsp" %>