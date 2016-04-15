<%Integer QUERIES=new Integer(0);
if(request.getAttribute("QUERIES")!=null)
QUERIES=(Integer)request.getAttribute("QUERIES");
long start=System.currentTimeMillis();
long end=System.currentTimeMillis();
long diff=end-start;
float elapse=(float)diff/1000;%>
</div>
<div id="footer"><hr/>
<span>Copyright &copy; 2011 <a href="http://www.m0interactive.com">m0 | interactive</a>. 
All rights reserved. Page loaded in <%=elapse%> seconds, using <%=QUERIES%> query(s)!</span><br/>
<span> Also: <a href="http://validator.w3.org/check?uri=referer" title="Valid XHTML!">XHTML</a>, 
<a href="http://jigsaw.w3.org/css-validator/check/referer" title="Valid CSS!">CSS</a>, 
<a href="http://www.contentquality.com/mynewtester/cynthia.exe?Url1=http://m0.myftp.org:35456/Bank/">508</a></span>
</div><hr/></body></html>