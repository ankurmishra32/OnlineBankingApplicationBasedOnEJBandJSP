<%@include file="header.jsp" %>
<%@page import="java.text.*, javax.naming.*, Validation.Account"%>
<%!Account account;%>
<%
try
{
    double balance=0.00;
    String usr=(String)session.getAttribute("usrid");
    Context context=new InitialContext();
    account=(Account)context.lookup(Account.class.getName());
%>
<h1>Account</h1>
<h2>My Account Summary</h2>
<table id="accsumm">
<thead>
	<tr>
		<td>Account Type</td>
		<td>Account Number</td>
		<td>Balance Available</td>
	</tr>
</thead>
<tbody>
    <%for(int i=1;i<=3;i++){%>
	<tr>
            <td><%=account.getAccountType(usr, i)==null?"":account.getAccountType(usr, i)%></td>
            <td><a href="detail.jsp?account=<%=account.getAccount(usr, i)%>"><%=account.getAccount(usr, i)==0?"":account.getAccount(usr, i)%></a></td>
            <td><%=account.getAmount(usr, i)==0?"":account.getAmount(usr, i)%></td>
        </tr>
    <%balance=balance+account.getAmount(usr, i);}%>
</tbody>
<tfoot>
	<tr>
		<td colspan="2">Total Day-to-Day Banking:</td>
                <td>Total Balance: <%=balance%></td>
	</tr>
</tfoot>
</table>

<div id="note">
<p>Notes</p>
<ul>
	<li>Important Information about how your accounts are displayed</li>
	<li>Click account number to view account information.</li>
	<li>Click on the balance to view the account details (where applicable).</li>
</ul>
</div>
<%}
catch(Exception e)
{
out.println(e.toString());
}
%>
<%@include file="footer.jsp" %>