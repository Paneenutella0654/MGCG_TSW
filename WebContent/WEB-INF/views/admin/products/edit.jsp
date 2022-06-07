<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="resources/css/product.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<z:layout pageTitle="Admin Product Edit">
	<h1 class="is-size-1">Modifica prodotto</h1>
	<form action="<c:url value="/Admin/Products" />" method="post">
		<input type="hidden" name="id" id="id" value="${bean.getId()}" required>
		<input type="hidden" name="action" value="put">
		<div class="form-group">
			<label for="name">Nome</label>
			<input type="text" class="form-control input" name="name" id="name" aria-describedby="nameHelp"
				value="${bean.getName()}">
			<small id="nameHelp" class="form-text text-muted">Immettere un nome descrittivo piccolo</small>
		</div>

		<div class="form-group">
			<label for="description">Descrizione</label>
			<input type="text" class="form-control input" name="description" id="description"
				aria-describedby="descriptionHelp" placeholder="Inserisci una descrizione per il prodotto"
				value="${bean.getDescription()}">
			<small id="descriptionHelp" class="form-text text-muted">Inserisci una descrizione per il prodotto</small>
		</div>

		<div class="form-group">
			<label for="shortDescription">Descrizione breve</label>
			<input type="text" class="form-control input" name="shortDescription" id="shortDescription"
				aria-describedby="shortDescriptionHelp" placeholder="Inserisci una breve descrizione"
				value="${bean.getShortDescription()}">
			<small id="shortDescriptionHelp" class="form-text text-muted">Inserisci una breve descrizione</small>
		</div>

		<div class="form-group">
			<label for="metaDescription">Meta Descrizione</label>
			<input type="text" class="form-control input" name="metaDescription" id="metaDescription"
				aria-describedby="metaDescriptionHelp" placeholder="Inserisci la meta descrizione"
				value="${bean.getMetaDescription()}">
			<small id="metaDescriptionHelp" class="form-text text-muted">Inserisci la meta descrizione</small>
		</div>

		<div class="form-group">
			<label for="metaKeyword">La Meta parola chiave</label>
			<input type="text" class="form-control input" name="metaKeyword" id="metaKeyword"
				aria-describedby="metaKeywordHelp" placeholder="Inserisci la meta parola chiave del prodotto"
				value="${bean.getMetaKeyword()}">
			<small id="metaKeywordHelp" class="form-text text-muted">Inserisci la meta parola chiave del prodotto</small>
		</div>

		<label for="price">Prezzo</label>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">&euro;</span>
			</div>
			<input type="text" class="form-control input" aria-label="Amount (to the nearest dollar)" name="price" id="price"
				value="${bean.getPrice()}" required>
		</div>
		
		<label for="tax">Imposta</label>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">%</span>
			</div>
			<input type="number" class="form-control input" aria-label="Tax Amount" name="tax" id="tax"
				value="${bean.getTax()}" required>
		</div>

		<label for="discount">Sconto</label>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">%</span>
			</div>
			<input type="text" class="form-control input" aria-label="Amount (in percentage)" name="discount" id="discount"
				required value="${bean.getDiscount()}">
		</div>

		<div class="form-group">
			<label for="onSale">Prodotto in vendita</label>
			<input type="number" class="form-control input" name="onSale" id="onSale" aria-describedby="onSaleHelp"
				placeholder="9" value="${bean.getOnSale()}">
			<small id="onSaleHelp" class="form-text text-muted">Inserisci il numero del prodotto in vendita</small>
		</div>

		<div class="form-group">
			<label for="quantity">Quantità</label>
			<input type="number" class="form-control input" name="quantity" id="quantity" aria-describedby="quantityHelp"
				placeholder="120" value="${bean.getQuantity()}">
			<small id="quantityHelp" class="form-text text-muted">Inserisci il numero di prodotti disponibili</small>
		</div>
		
		<div class="form-group">
		<label for="categories">Categorie</label>
		<div class="select is-multiple">
			
			<!-- multiple size="${categories.size()}" -->
		  <select name="categories" id="categories">
		    <c:forEach items="${categories}" var="cat">
		    <option value="${cat.getId()}" ${bean.getCategories().contains(cat) ? "selected" : ""}>${cat.getName()}</option>
		    </c:forEach>
		  </select>
		</div>
		</div>

		<div class="form-check mb-3">
			<input class="form-check-input" type="checkbox" value="" name="available" id="available" checked>
			<label class="form-check-label" for="available">
				È disponibile
			</label>
		</div>
		<button type="submit" class="btn btn-success mt-2">Aggiorna prodotto</button>
		<c:if test="${error != null}">
			<div class="error">
				<p> ${error} </p>
			</div>
		</c:if>
	</form>
</z:layout>