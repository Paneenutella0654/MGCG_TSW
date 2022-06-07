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
					<a href="User?action=viewData">
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
			<a class="user-logout" href="Login?action=logout">Chiudi la sessione</a>
		</div>

		<div class="right">
			<div class="header">
				<h3 class="title-left is-size-4">Indirizzo</h3> <a href="User?action=createAddress"><i class="fa fa-plus-square fa-2x"></i></a>
			</div>
			<div class="user-previous-orders">
				<c:forEach items="${user.getAddresses()}" var="address">
					<div class="order-details">
						<div class="flex-spaced">
							<div class="flex">
								<i class="fa fa-home fa-2x"></i>
								<ul>
									<li class="delivery-date">${address.getAlias()}
										<c:if test="${address.isPreferred()}">
										<i class="fa fa-star fa-2x"></i>
										</c:if>
									</li>
									<li class="bouquet-name"></li>
									<li class="bouquet-price mobile-hidden">
										${address.getFirstName()} ${address.getLastName()} 
									</li>
									<li class="order-number">${address.getAddress()}</li>
									<li class="invoice-links">
										${address.getPostalCode()} ${address.getCity()} (${address.getProvince()}) 
									</li>
								</ul>
							</div>
							<div class="flex">
								<ul>
									<li><a class="links" href="User?action=editAddress&id=${address.getId()}">Modifica Indirizzo</a></li>
									<c:if test="${!address.isPreferred()}">
										<li class="mt-4">
											<form action="User" method="post">
												<input type="hidden" name="action" value="setPreferredAddress">
												<input type="hidden" name="id" value="${address.getId()}">
												<button type="submit" class="links btn-info">Setta un preferito</button>
											</form>
										</li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</z:layout>