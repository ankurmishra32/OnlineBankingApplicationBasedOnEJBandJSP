<%@include file="header.jsp" %>
<h1>Bill Payment</h1>
<h2> Payee View</h2>
<%@include file="payment_side.jsp" %>
<ul id="payview">
	<li>You have no payees, please add a Payee!</li>
</ul>

<div id="note">
<p>Notes </p>
<ul>
	<li>Those payees are registerd under your account.</li>
	<li>When you delete a payee it is still recorded in your Activities.</li>
</ul>
</div>

<%@include file="footer.jsp" %>