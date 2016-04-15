<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Online Banking Application.</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	<meta name="author" content="Xccelarator"/>
	<meta name="keywords" content="Kurukshetra University"/>
	<link rel="stylesheet" type="text/css" href="css/base.css" title="Default"/>
       
</head>
<body>
<%
    String active = "class=\"active\"";
    String module = request.getParameter("Module");
    String result=(String)request.getSession().getAttribute("result");
    if(module == null) module  = "";
    if(result == null && module != "") module = "";
    if(result != null && module == "") module = "HOME";
    if(session.isNew()||result==null){
%>
<div id="container" class="<%=module%>isBackImg">
     <div id="header">
         <div id="lefthead"><a href="/BankApp/" title="Go Back to Home Page!"> </a></div>
         <div id="subbar"><p>Welcome Guest</p></div>
    </div>
</div>
<%}else{%>
<div id="container" class="<%=module%>isBackImg">
     <div id="header">
         <div id="lefthead"><a href="/BankApp/" title="Go Back to Home Page!"> </a></div>
         <div id="subbar"><p>Welcome <%=session.getAttribute("user")==null?"Guest":session.getAttribute("user")%></p></div>
    </div>
</div>
<%if(result.equals("logged")){%>
                <div id="nav">
                    <ul>
                        <li <%=module.equals("HOME") ? active : ""%>><a href="main.jsp?Module=HOME">Home</a></li>
			<li <%=module.equals("ACCOUNT") ? active : ""%>><a href="account.jsp?Module=ACCOUNT">Accounts</a></li>
			<li <%=module.equals("PAYMENT") ? active : ""%>><a href="payment.jsp?Module=PAYMENT">Payments</a></li>
			<li <%=module.equals("TRANSFER") ? active : ""%>><a href="transfer.jsp?account=nil&Module=TRANSFER">Transfers</a></li>
			<li <%=module.equals("PROFILE") ? active : ""%>><a href="profile.jsp?Module=PROFILE">Profile</a></li>
			<li <%=module.equals("LOGOUT") ? active : ""%>><a href="logout.jsp?Module=LOGOUT">Logout</a></li>
                    </ul>
                </div>
<%}else{
    if(result.equals("unautherized")){%>
    <div class="error">
        Your password is invalid
    </div>
    <hr/>
    <%}if(result.equals("not_found")){%>
    <div class="error">
        Your username is invalid
    </div>
    <hr/>
    <%}}}%>
<div id="main">