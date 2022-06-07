<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="resources/css/user-profile.css" rel="stylesheet" type="text/css">
<link href="resources/css/summary.css" rel="stylesheet" type="text/css">
<z:layout pageTitle="Checkout">
	<div id="notification" class="notification is-hidden"><button class="delete" onclick="closeNotification()">X</button><span id="notification-text">Test</span></div>
	<h1 class="is-size-4">Riepilogo dell'ordine</h1>
	<div class="summary">
		<div class="left">
			<div class="address">
				<div class="num">
					<h2>1.</h2>
				</div>
				<div class="head">
					<h2>Indirizzo di consegna</h2>
				</div>
				
				<div id="checkout-address" class="body">
					<c:if test="${address != null}">
						<p>${address.getFirstName() } ${address.getLastName() }</p>
						<p>${address.getAddress()}</p>
						<p>${address.getPostalCode() } ${address.getCity()} (${address.getProvince()})</p>
						<p>${address.getInfo()}</p>
					</c:if>
					<c:if test="${address == null }">
						<p>Nessun indirizzo, aggiungine uno</p>
					</c:if>
				</div>
				<div class="actions">
					<button id="btn-addressModal" class="button is-success">Seleziona</button>
				</div>
			</div>
			<hr>
			<div class="payment">
				<div class="num">
					<h2>2.</h2>
				</div>
				<div class="head">
					<h2>Pagamenti</h2>
				</div>
				<div class="body">
					<p><b>Mastercard</b> termina con **62</p>
				</div>
				<div class="actions">
						<button id="btn-inserisci" class="button is-success">
						<a href="<c:url value="/Payment"/>">Inserisci</a></button>
				</div>
			</div>
			<hr>
			<div class="order-items">
				<div class="order-details">
					<div class="flex-spaced">
						<div class="flex">
							<img class="order-details-image"
								src="/MGCG/resources/images/corrierecamion.png">
							<ul>
								<li class="delivery-date">Consegna domani</li>
						
								<li class="order-number">Consegna Exspress</li>
								
								<li class="invoice-links">
									<a href="#" target="_blank" class="download-link"></a>
									<a href="#" class="generate-invoice"></a>
								</li>
							</ul>
						</div>
						
					</div>
				</div>
			</div>	
			<div class="row buy"></div>
		</div>
		<div class="right">
			<form action="Orders" method="post">
				<input type="hidden" name="action" value="buy"/>
				<div class="right-buy">
					<button class="links" type="submit">Compra ora</button>
				</div>
				<hr>
				<div>
					<div><p>Spese di spedizione</p></div>
					<div><p>10.00 &euro;</p></div>
				</div>
				<br>
				<h3>Tasse incluse  22%</h3>
				<div class="form-check mb-4">
					<input class="form-check-input" type="checkbox" value="" name="isGift" id="isGift">
					<label class="form-check-label" for="isGift">
						E' un regalo
					</label>
				</div>
			
				<div class="form-group">
					<label for="giftMessage"></label>
					<input type="text" class="form-control" name="giftMessage" id="giftMessage" aria-describedby="giftMessageHelp"
						placeholder="Tanti auguri di buon compleano..." disabled>
				</div>
			</form>
		</div>
		
		
	</div>
	<div id="addressModal" class="modal">
			<div class="modal-background"></div>
			<div class="modal-card">
				<header class="modal-card-head">
				  <p class="modal-card-title">Seleziona un indirizzo</p>
				  <button id="btn-addressModalClose" class="delete" aria-label="close"></button>
				</header>
				<section id="body-addressModal" class="modal-card-body">
					
	 			</section>
				<footer class="modal-card-foot">
					<a class="button is-success" href="<c:url value="/User?action=createAddress"/>">Crea nuovo indirizzo</a>
					<button id="btn-addressModalCancel" class="button is-danger">Cancella</button>
				</footer>
			</div>
		</div>
	
	<script>
	function closeNotification() {
		$("#notification").addClass("is-hidden");
	}
	$(document).ready(function() {
		$('#btn-addressModal').on("click", function (){
			$.get("Api/User", { action:"getAddresses" }, function(data) {
				$('#body-addressModal').empty();
				$(data).each((e, k) => {
					var card="";
					card += "					<header class=\"card-header\">";
					card += "					    <p class=\"card-header-title\">";
					card += "					      <i class=\"fa fa-home mr-2\"> <\/i> "+ k.alias;
					card += "					    <\/p>";
					card += "					<\/header>";
					card += "					<div class=\"card-content\">";
					card += "					  <div class=\"content\">";
					card += "					  <div class=\"columns is-vcentered\">";
					card += "					  	<div class=\"column is-four-fifths\">";
					card += "						    " + k.firstName + " " + k.lastName;
					card += "						    <br>";
					card += "						    " + k.address;
					card += "						    <br>";
					card += "						    "+ k.postalCode +" "+ k.city +" ("+ k.province +")";
					card += "					    <\/div>";
					card += "					    <div class=\"column\">";
					card += "					    	<button id='address_"+k.id+"' class=\"button is-success\">Seleziona<\/button>";
					card += "					    <\/div>";
					card += "					  <\/div>";
					card += "					  <\/div>";
					card += "					<\/div>";
					$('#body-addressModal').append(card);
					
					$('#address_'+k.id).on("click", function() {
						$.post("Api/Orders", { action: "setAddress", address:JSON.stringify(k) }, function(data) {
							var addr="";
							addr += "						<p>"+k.firstName+" "+k.lastName+"<\/p>";
							addr += "						<p>"+k.address+"<\/p>";
							addr += "						<p>"+k.postalCode+" "+k.city+" ("+k.province+")<\/p>";
							addr += "						<p><\/p>";
							$('#checkout-address').empty();
							$('#checkout-address').append(addr);
							$('#addressModal').removeClass('is-active');
						})
						.fail(function() {
							$("#notification-text").text("Error while adding address");
							$("#notification").addClass("is-danger");
							$("#notification").removeClass("is-hidden");
						})
					});
					
				});
				
			});
			$('#addressModal').addClass("is-active");
		});
		
		$('#btn-addressModalCancel, #btn-addressModalClose').on("click", function(){
			$('#addressModal').removeClass("is-active");
		});
	});
	
	$("#isGift").change(function() {
	    if(this.checked) {
	    	$('#giftMessage').removeAttr("disabled");
	    	$('#giftMessage').prop("required", this.checked);
	    } else {
	    	$('#giftMessage').prop("disabled", true);
	    	$('#giftMessage').removeAttr("required");
	    }
	});
	</script>
</z:layout>