<%@include file="header.jsp"%>
<h1>Bill Payment</h1>
<h2>Pay a Bill</h2>
<%@include file="payment_side.jsp"%>
<form id="reg" method="post" action="/Bank/MainController.html?Module=PAYMENT">
<p>You must add a payee first!</p>
</form>

<div id="note">
<p>Notes </p>
<ul>
	<li>Date must be today or later!</li>
	<li>The balance on your account doesn't have overdraft protection.</li>
	<li>Use the navigation above to add/view a payee or pay a bill.</li>
</ul>
</div>

<%@include file="footer.jsp"%>