<%@ page import="Validation.Login, javax.naming.*" %>
<%! Login login;%>
<%
    String usr=request.getParameter("username");
    String psw=request.getParameter("password");
    try
    {
        Context context=new InitialContext();
        login=(Login)context.lookup(Login.class.getName());
        String result=login.checkLogin(usr,psw);
        session.setAttribute("result",result);
        if(result.equals("logged"))
        {
            String user=login.getUser(usr);
            session.setAttribute("user", user);
            session.setAttribute("usrid", usr);
            response.sendRedirect("main.jsp?Module=HOME");
        }
        else
        {
            response.sendRedirect("login.jsp");
        }
    }
    catch(Exception e)
        {
            out.println(e.toString());
        }
%>