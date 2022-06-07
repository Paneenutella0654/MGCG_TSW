<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="resources/css/product.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<z:layout pageTitle="Admin Product Create">
	<h1 class="is-size-3">Crea un nuovo Prodotto</h1>
	<form action="<c:url value="/Admin/Products" />" method="post">
		<input type="hidden" name="action" value="create">
		<div class="form-group">
			<label for="name">Nome</label>
			<input type="text" class="form-control input" name="name" id="name" aria-describedby="nameHelp"
				placeholder="Inserisci il nome del prodotto" required>
			<small id="nameHelp" class="form-text text-muted">Immettere una descrizione breve</small>
		</div>

		<div class="form-group">
			<label for="description">Descrizione</label>
			<input type="text" class="form-control input" name="description" id="description"
				aria-describedby="descriptionHelp" placeholder="Inserisci la descrizione del prodotto" required>
			<small id="descriptionHelp" class="form-text text-muted">Inserisci il nome</small>
		</div>

		<div class="form-group">
			<label for="shortDescription">Breve Descrizione</label>
			<input type="text" class="form-control input" name="shortDescription" id="shortDescription"
				aria-describedby="shortDescriptionHelp" placeholder="Immettere una descrizione breve">
			<small id="shortDescriptionHelp" class="form-text text-muted">Immettere una descrizione breve</small>
		</div>

		<div class="form-group">
			<label for="metaDescription">Meta Description</label>
			<input type="text" class="form-control input" name="metaDescription" id="metaDescription"
				aria-describedby="metaDescriptionHelp" placeholder="Inserisci la  meta description">
			<small id="metaDescriptionHelp" class="form-text text-muted">Inserisci la  meta description</small>
		</div>

		<div class="form-group">
			<label for="metaKeyword">Meta Keyword</label>
			<input type="text" class="form-control input" name="metaKeyword" id="metaKeyword"
				aria-describedby="metaKeywordHelp" placeholder="Inserisci la meta keyword">
			<small id="metaKeywordHelp" class="form-text text-muted">Inserisci la meta keyword</small>
		</div>

		<label for="price">Prezzo</label>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">&euro;</span>
			</div>
			<input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" name="price" id="price"
				required>
		</div>
		
		<label for="tax">Tassa</label>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">%</span>
			</div>
			<input type="number" class="form-control input" aria-label="Tax Amount" name="tax" id="tax"
				required>
		</div>

		<label for="discount"></label>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">%</span>
			</div>
			<input type="text" class="form-control input" aria-label="Amount (in percentage)" name="discount" id="discount"
				required>
		</div>

		<div class="form-group">
			<label for="onSale">Prodotto in saldo</label>
			<input type="number" class="form-control input" name="onSale" id="onSale" aria-describedby="onSaleHelp"
				placeholder="9" required>
			<small id="onSaleHelp" class="form-text text-muted">Inserisci il numero del prodotto in saldo</small>
		</div>

		<div class="form-group">
			<label for="quantity">Quantità</label>
			<input type="number" class="form-control input" name="quantity" id="quantity" aria-describedby="quantityHelp"
				placeholder="120" required>
			<small id="quantityHelp" class="form-text text-muted">Inserici la quantità in magazzino</small>
		</div>
		
		<div class="form-group">
		<label for="categories">Categoria</label>
		<div class="select is-multiple">
			
		  <select multiple size="${categories.size()}" name="categories" id="categories">
		    <c:forEach items="${categories}" var="cat">
		    <option value="${cat.getId()}">${cat.getName()}</option>
		    </c:forEach>
		  </select>
		</div>
		</div>

		<div class="form-check mb-3">
			<input class="form-check-input" type="checkbox" value="" name="available" id="available" checked>
			<label class="form-check-label" for="available">
				Disponibile
			</label>
		</div>

		<button type="submit" class="btn btn-success mt-2">Crea</button>
	</form>
</z:layout>