<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<z:layout pageTitle="Admin Control Panel">
	<h1>Benvenuto nel pannello di controllo dell'amministratore</h1>
	<div>
		<a href="<c:url value="/Admin/Orders"/>">Gestisci gli ordini</a>
		<br>
		<a href="<c:url value="/Admin/Products"/>">Gestisci i prodotti</a>
		<br>
		<a href="<c:url value="/Admin?action=viewLogs"/>">Visualizza registri</a>
		<a href="<c:url value="/Admin?action=clearLogs"/>">Cancella registri</a>
	</div>
	<h1 class="mt-2 mb-2">Elenco registri</h1>
	<c:forEach items="${logs}" var="log">
		<p>${log}</p>
	</c:forEach>
</z:layout>