<%@include file="header.jsp" %>
<script type="text/javascript">
function checkLogin()
{
    if(document.login.username.value==="")
    {
        alert("Please enter your username.\n");
        document.login.username.focus();
        return false;
    }
    if(document.login.password.value==="")
    {
        alert("Please enter your password.\n");
        document.login.password.focus();
        return false;
    }
}
</script>

<h1>Sign-on to Online Banking Application.</h1>
<form name="login" id="reg" method="post" action="validate.jsp" onSubmit="return checkLogin()">
    <ul>
        <li>
            <label for="username">Username</label>
            <input id="username" type="text" name="username"  value="<%=session.getAttribute("usrid")==null?"":session.getAttribute("usrid")%>"/>
        </li>
        <li>
            <label for="password">Password</label>
            <input id="password" type="password" name="password"  value=""/>
        </li>
        <li>
            <input type="hidden" name="action" value="LOGIN" />
            <input class="nolabel" type="submit" name="submit" value="Login" />
        </li>
    </ul>
        <div id="note">
            <p>Notes </p>
            <ul>
                <li>Your Login session will expire after 1 hour!</li>
                <li>All activity is logged.</li>
            </ul>
        </div>
</form>
<%@include file="footer.jsp" %>