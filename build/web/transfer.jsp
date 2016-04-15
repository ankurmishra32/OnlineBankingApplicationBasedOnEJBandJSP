<%@include file="header.jsp"%>
<script type="text/javascript">
function checkAmount()
{
    if(document.transfer.amount.value=="")
    {
        alert("Please enter valid amount to transfer to account.\n");
        document.login.amount.focus();
        return false;
    }
    if(document.transfer.to.value==""||document.transfer.to.value.length!=10)
    {
        alert("Please enter correct account number to transfer amount.\n");
        document.transfer.to.focus();
        return false;
    }
    if(document.transfer.amount.value>document.transfer.accblc.value)
    {
        alert("You have not sufficient balace to do transaction of that amount.\n");
        document.login.amount.focus();
        return false;
    }
}
</script>
<%@page import="java.text.*, javax.naming.*, Validation.Account"%>
<%!Account account; int select=1;%>
<%
try
{
    String usr=(String)session.getAttribute("usrid");
    Context context=new InitialContext();
    account=(Account)context.lookup(Account.class.getName());
%>

<h1>Transfer</h1>

<%if(session.getAttribute("success")==null)
{%><h2>Transfer an Account</h2><%}
else if(session.getAttribute("success").equals("success"))
{%><div class="good">Amount is Transfer successfully!</div><%}
else if(session.getAttribute("success").equals("fail"))
{%><div class="error">Your transaction fail</div><%}%>

<form name="transfer" id="reg" method="post" action="money.jsp" onSubmit="return checkAmount()">
<ul>
    <li>
        <label for="from">From Account </label>
        <select name="from" onChange="location.href='transfer.jsp?account='+this.value;">
            <%for(int i=1;i<=3;i++){%>
            <option value="<%=account.getAccount(usr, i)%>"<%if(request.getParameter("account").equals("nil"))
            {}else{if(Long.parseLong(request.getParameter("account"))==account.getAccount(usr, i))
            {select=i;%> selected<%}}%>>
                <%=account.getAccountType(usr, i)%> - <%=account.getAccount(usr, i)%>
            </option><%}%>
        </select>
    </li>
    <li>
        <label for="accblc">Account Balance $ </label>
        <input id="accblc" type="text" name="accblc" value="<%=account.getAmount(usr, select)==0?"":account.getAmount(usr, select)%>" /><br />
    </li>
    <li>
        <label for="to">Transfer Account </label>
        <input id="to" type="number" name="to" value="" /><br />
    </li>
    <li>
        <label for="amount">Transfer Amount $ </label>
        <input id="amount" type="text" name="amount" value="" /><br />
    </li>
    <li>
        <input name="action" value="TRANSFER_MONEY" type="hidden" />
        <input class="nolabel" type="submit" name="submit" value="Submit" />
    </li>
</ul>
</form>

<div id="note">
<p>Notes </p>	 
<ul>
	<li>Transfers exist instantly!</li>
	<li>Must have money in the account in order to transfer!</li>
</ul>
</div>
<%}
catch(Exception e)
{
out.println(e.toString());
}
%>
<%@include file="footer.jsp" %>