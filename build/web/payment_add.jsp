<%@include file="header.jsp" %>
<h1>Bill Payment</h1>
<h2>Add a Payee</h2>
<%@include file="payment_side.jsp" %>
<form id="reg" method="post" action="/Bank/MainController.html?Module=PAYMENT" >
    <ul>
	<li>
            <label for="best_time">Payee List:</label>
            <select name="payee_list" id="payee_list">
                <option value="">Electricity Bill</option>
                <option value="">Water Bill</option>
                <option value="">Telephone Bill</option>
            </select>
        </li>
	<li>
		<input type="hidden" name="action" value="ADD_PAYEE">
		<input class="nolabel" type="submit" name="submit" value="Add Payee" />
	</li>
    </ul>
</form>

<div id="note">
<p>Notes </p>
<ul>
    <li>If you wish to add a payee to the list, please contact the branch for approval. (security purposes)</li>
</ul>
</div>
<%@include file="footer.jsp" %>