<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="resources/css/user-profile.css" rel="stylesheet" type="text/css">
<z:layout pageTitle="Profile">

	<h1 class="is-size-3">Ciao! ${user.getFirstName()} </h1>
	<div class="user-profile">
		<div class="user-profile-menu">
			<ul>
				<li>
					<h2 class="title">Account</h2>
				</li>
				<li>
					<a href="User?action=viewData" class="active">
						<p>Informazioni personali</p>
					</a>
				</li>
				<li>
					<a href="User?action=viewOrders" class="active">
						<p>Ordini</p>
					</a>
				</li>
				<li>
					<a href="User?action=viewAddresses" class="active">
						<p>Indirizzi</p>
					</a>
				</li>
				
			</ul>
			<a class="user-logout" href="Login?action=logout">Logout</a>
		</div>

		<div class="right">
			<h3 class="title-left is-size-4 has-text-weight-semibold">Ordini</h3>
			<div class="user-previous-orders">
				<c:if test="${orders.size() == 0 }">
					<p>Nessun ordine...!</p>
				</c:if>
				<c:forEach items="${orders}" var="order">
					<div class="order-details">
						<div class="flex-spaced">
							<div class="flex">
								<img class="order-details-image"
									src="/MGCG/resources/images/orderimg.png">
								<ul>
									<li class="delivery-date">${order.getStatus()}</li>
										${order.getTotalPaidString() }&euro;
										<span>, con sconto</span>
									<li class="order-number">Ordine numero ${order.getId()}</li>
									<li class="invoice-links">
										<a href="User?action=invoiceView&orderId=${order.getId()}" target="_blank" class="generate-invoice">Genera fattura</a>
									</li> 
								</ul> 
							</div> 
							<div class="flex"> 
								<ul>
									<li><a class="links" href="Orders?action=details&&id=${order.getId()}">Vedi Dettagli</a></li>
								</ul>

							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	 
<script>
<!-- Indirizzamento alla fattura -->
function target(id) {
	let handle = window.open(popunder,"User?action=invoiceDownload&orderId="+id);
	handle.blur();
	window.focus();
}


</script>
	
	
</z:layout>