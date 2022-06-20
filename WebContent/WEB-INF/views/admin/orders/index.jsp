<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="<c:url value="/resources/css/admin.css"/>" rel="stylesheet" type="text/css">
<z:layout pageTitle="Admin Orders Manager">
	<h1 class="mb-3 is-size-3"> Cerca Ordine</h1>
	<div class="">
		<form action="<c:url value="/Admin/Orders"/>" method="get">
			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="userId">Utente</label>
						<select name="userId" id="userId" class="form-control" aria-label="Default select example">
							<option value="0" selected></option>
							<c:forEach items="${users}" var="user">
							<option value="${user.getId()}">${user.getEmail()}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="dateFrom">Da</label>
						<input type="date" class="form-control" name="dateFrom" id="dateFrom" aria-describedby="dateFromHelp">
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="dateTo">a</label>
						<input type="date" class="form-control" name="dateTo" id="dateTo" aria-describedby="dateToHelp">
					</div>
				</div>
			</div>
			<button class="btn btn-success">Cerca</button>
		</form>
	</div>
	<br>
	<c:if test="${orders.size() == 0}">
		<h1 class="is-size-1">Ordine non trovato</h1>
	</c:if>
	<c:if test="${orders.size() > 0}">
	<h1 class="is-size-3">Ordini</h1>
	</c:if>
	
	<c:forEach items="${orders}" var="order">
	<div class="admin-order">
		<div class="body">
		 	<p><b>Order n. ${order.getId() }</b></p>
		 	<p>Date. ${order.getCreatedAt() }</p>
		 	<p>Products: ${order.getTotalProducts() }</p>
		 	<p>Total: ${order.getTotalPaid() }</p>
		 	<p>Destination: </p>
		 	<p>${order.getDestination() }</p>
		 	<p>Tracking: ${order.getTrackNumber() }</p>
		 	<c:if test="${order.isGift()}">
		 		<p>Message: ${order.getGiftMessage() }</p>
		 	</c:if>
	 	</div>
	 	<div class="actions">
	 		<a href="<c:url value="/Admin/Orders?action=view&id=${order.getId()}"/>" class="btn btn-success">Visualizzazione</a>
    		<a href="<c:url value="/Admin/Orders?action=edit&id=${order.getId()}"/>" class="btn btn-primary">Modifica</a>
    		<form action="<c:url value="/Admin/Orders"/>" method="post">
    			<input type="hidden" name="action" id="action" value="delete">
    			<input type="hidden" name="id" id="id" value="${order.getId()}">
    			<button class="btn btn-danger" style="width: 100%">Elimina</button>
    		</form>
    	</div>
	</div>
	</c:forEach>
	<div class="admin-pages">
	<c:forEach items="${pages}" var="page" varStatus="loop">
    	<a class="page-btn" href="<c:url value="/Admin/Orders?${page.getValue()}"/>"><span>${page.getKey()}</span></a>
	</c:forEach>
	</div>
</z:layout>