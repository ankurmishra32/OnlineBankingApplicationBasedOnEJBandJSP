<%@page import="java.text.*, javax.naming.*, Validation.Transaction"%>
<%!Transaction transaction; int select=1;%>
<%
String user,result;
String usr=(String)session.getAttribute("usrid");
long reacc=Integer.parseInt(request.getParameter("to"));
long seacc=Integer.parseInt(request.getParameter("from"));
double money=Double.parseDouble(request.getParameter("amount"));
double amount=Double.parseDouble(request.getParameter("accblc"));
try
{
    Context context=new InitialContext();
    transaction=(Transaction)context.lookup(Transaction.class.getName());
    user=transaction.checkAccount(reacc);
    if(money>=amount||money<=0)
    {
        result="fail";
    }
    else
    {
        result=transaction.transferTo(user, reacc, money);
        if(result.equals("success"))
        {
        result=transaction.transferFrom(usr, seacc, money);
        if(result.equals("success"))
        {
            result=transaction.viewSender(usr, seacc, reacc, money);
            if(result.equals("success"))
            result=transaction.viewReciver(user, reacc, seacc, money);
        }}
    }
    session.setAttribute("success", result);
    response.sendRedirect("transfer.jsp?account=nil");
}
catch(Exception e)
{
out.println(e.toString());
}
%>