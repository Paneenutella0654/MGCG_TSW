<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="resources/css/admin.css" rel="stylesheet" type="text/css">
<z:layout pageTitle="Admin Control Panel">
	<h1 class="is-size-4">Benvenuto nel pannello di controllo dell'amministratore</h1>
	<div>
		<a href="<c:url value="/Admin/Orders"/>">Gestisci gli ordini</a>
		<br>
		<a href="<c:url value="/Admin/Products"/>">Gestisci i prodotti</a>
		<br>
		<a href="<c:url value="/Admin?action=viewLogs"/>">Visualizza registri</a>
		<br>
		<a class="admin-logout" href="<c:url value="/Login?action=logout"/>" href="">Logout</a>
	</div>
</z:layout>