<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<z:layout pageTitle="Admin Order Edit">
<h1 class="is-size-2">Aggiornamento Ordine N. ${bean.getId()}</h1>
	<form action="<c:url value="/Admin/Orders" />" method="post">
		<input type="hidden" name="action" id="action" value="put">
		<input type="hidden" name="id" id="id" value="${bean.getId()}">
		<div class="form-group">
			<label for="destination">Destinazione</label>
			<input type="text" value="${bean.getDestination()}" class="form-control input" name="destination" id="destination"
				aria-describedby="detinationHelp" placeholder="Inserisci la destinazione">
			<small id="destinationHelp" class="form-text text-muted">Immettere l'indirizzo di destinazione</small>
		</div>
		<div class="form-group">
			<label for="trackNumber">Numero di identificazione</label>
			<input type="text" value="${bean.getTrackNumber()}" class="form-control input" name="trackNumber" id="trackNumber"
				aria-describedby="trackNumberHelp" placeholder="Inserisci un nuovo numero di tracciamento">
			<small id="trackNumberHelp" class="form-text text-muted">Inserisci il numero di tracciamento</small>
		</div>
		<c:if test="${bean.isGift()}">
		<div class="form-group">
			<label for="giftMessage">Messaggio regalo</label>
			<input type="text" value="${bean.getGiftMessage()}" class="form-control input" name="giftMessage" id="giftMessage"
				aria-describedby="giftMessage" placeholder="Inserisci messaggio regalo">
			<small id="giftMessage" class="form-text text-muted">Inserisci messaggio regalo</small>
		</div>
		</c:if>
		<button type="submit"  class="btn btn-success mt-2">Aggiorna ordine</button>
	</form>
</z:layout>