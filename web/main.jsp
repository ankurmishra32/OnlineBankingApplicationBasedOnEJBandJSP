<%@include file="header.jsp" %>
<%
String value=null;
session.setAttribute("profile",value);
session.setAttribute("success",value);
session.setAttribute("password",value);
if(session.isNew()||(session.equals(null)))
response.sendRedirect("login.jsp");
%>
<h1>Main</h1>
<div id="homecont">
<p>Welcome to the new generation Online Banking! This system follows webstandards and by using Java EE technology it makes it one of the most sophisticated technology out there.</p>
<p>The total framework is made especially for reusability future expansion. It a 3-tier architecture enabling it to be proficient on serving thousands of people.</p>
<p>The presentational layer is completly separate. Take a look by choosing your own style from the drop down above(top/right of screen). As you see the layout of the whole web application can change instantly without even looking at 1 character of code, ever!</p>
<p>The data layer is very flexible in a fact that any DBMS can be its component, enabling future modifiability. Currently its run by Microsoft Access. It has 3 built in functions and triggers. It has a event handler that handles the savings interest and money transfers.</p>
<p>Overall this software is only for $1000USD, enjoy ;)</p>
</div>
<%@include file="footer.jsp" %>