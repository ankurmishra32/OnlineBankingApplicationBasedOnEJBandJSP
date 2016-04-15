<%@ page import="Validation.Update, javax.naming.*" %>
<%! Update update;%>
<%
String usr=(String)session.getAttribute("usrid");
String value=request.getParameter("value");
try
{
Context context=new InitialContext();
update=(Update)context.lookup(Update.class.getName());
if(value.equals("password"))
{
    String cpass=request.getParameter("cpass");
    String npass=request.getParameter("pass1");
    String result=update.upPassword(usr, cpass, npass);
    session.setAttribute("password", result);
    response.sendRedirect("profile.jsp");
}
if(value.equals("account"))
{
    String cpass=request.getParameter("cpass");
    String adrs1=request.getParameter("address1");
    String adrs2=request.getParameter("address2");
    String city=request.getParameter("city");
    String state=request.getParameter("state");
    String landline=request.getParameter("landline");
    String mobile=request.getParameter("mobile");
    String result=update.upAddress(usr, cpass, adrs1, adrs2, city, state);
    if(result.equals("success"))
    update.upPhone(usr, landline, mobile);
    session.setAttribute("profile", result);
    response.sendRedirect("profile.jsp");
}}
catch(Exception e)
{
    out.println(e.toString());
}
%>
