<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="resources/css/product.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<z:layout pageTitle="Products List">
	<div class="field searchbar">
	  <div class="control has-icons-left has-icons-right">
	  	<div id="dropdownsearch" class="dropdown is-active">
	  	  <div class="dropdown-trigger">
	  	    <input id="search" name="search" class="input" type="text" placeholder="Cerca...">
	  	    <span class="icon is-small is-left">
		      <i class="fas fa-search"></i>
		    </span>
	  	  </div>
	  	  <div id="dropdownmenu" class="dropdown-menu">
	  	    
	  	  </div>
	  	</div>
	  </div>
	</div>
	<c:if test="${products.size() == 0}">
		<p class="">Non sono prodotti per questa categoria</p>
	</c:if>
		
	<div class="product-list">
		<c:forEach items="${products}" var="bean">
			<div class="product-wrapper">
			  <div class="product-container">
			    <div class="product-top">
			    	<img src="${bean.getImagePath()}">
			    </div>
			    <div class="product-bottom">
			      <div class="product-left">
			        <div class="product-details">
			          <h3 class="title"><a href="<c:url value="/Products?action=view&id=${bean.getId()}"/>">${bean.getName()}</a></h3>
			          <p class="subtitle">&euro; ${bean.getPrice()}</p>
			        </div>
			        <div id="productadd_${bean.getId()}" class="product-buy"><i class="material-icons">add_shopping_cart</i></div>
			      </div>
			      <div class="product-right">
			        <div class="product-done"><i class="material-icons">fatto</i></div>
			        <div class="product-details">
			          <h3 class="title">${bean.getName()}</h3>
			          <p class="subtitle">Aggiungi al carrello</p>
			        </div>
			        <div id="productremove_${bean.getId()}" class="product-remove"><i class="material-icons">clear</i></div>
			      </div>
			    </div>
			  </div>
			  <div class="inside">
			    <div class="icon"><i class="material-icons">info_outline</i></div>
			    <div class="contents">
			      <table>
			        <tr>
			          <th>Paese di Produzione</th>
			          <th>Originale </th>
			        </tr>
			        <tr>
			          <td>Italia</td>
			          <td>SI</td>
			        </tr>
			        <tr>
			          <th>Marca</th>
			          <th>Id Prodotto</th>
			        </tr>
			        <tr>
			          <td>${bean.getMetaKeyword()}</td>
			          <td>${bean.getId()}</td>
			        </tr>
			      </table>
			    </div>
			  </div>
			</div>
		</c:forEach>
	</div>
	
	<script>
	 <!-- Script per rimuovere la classe dalla barra di ricerca-->
	$("#dropdownmenu").on("click", "a", function() {
		$("#search").val(this.text);
		$("#dropdownsearch").removeClass("is-active");
	})
	
	 //Script per la ricerca
	
	var _changeSearch = null;
	$(document).ready(function(e) {
		$("#search").on("keyup", function(){
			clearInterval(_changeSearch);
			
			_changeSearch = setInterval(function() {
				//Funzione richiamata quando si scrive in Search e
				//abbiamo finito di scrivere (viene richiamata dopo x secondi, vedi intervallo setInterval)
				//var suggestions = JSON.parse('[{"name": "Lorem"},{"name": "eu"},{"name": "non"},{"name": "ullamco"},{"name": "duis"},{"name": "consequat"},{"name": "enim"},{"name": "dolore"},{"name": "esse"},{"name": "Lorem"},{"name": "commodo"},{"name": "et"},{"name": "laboris"},{"name": "magna"},{"name": "labore"}]');
				var textToSearch = $("#search").val();
				if(textToSearch.length > 3) {
					$.get("Api/Products", { action: "search", val: textToSearch }, function(data) {    // il $.get(...) e una chimata di Ajax
						$("#dropdownmenu").empty();
						if(data.length > 0) {
							data.forEach((e) => {
								var myvar = '<div class="dropdown-content"><a class="dropdown-item" href="Products?action=search&searchVal='+ e.name + '">' + e.name + '</a></div>';
								$("#dropdownmenu").append(myvar);   //Modifica del DOM
							})
							$("#dropdownsearch").addClass("is-active");
						}
					})
				}
		        clearInterval(_changeSearch)
		    }, 1000);
		});
		
		//Script per quando si preme invio che manda in esecuzione la ricerca
		
		$("#search").on('keypress',function(e) {
		    if(e.which == 13) {  //Viene Uguagiato al 13 poiche 13 "dovresse essere la corrispondenza del tasto invio"
		    	location.href = 'Products?action=search&searchVal=' + $("#search").val()
		    }
		});
	})
	
	
	
	// Script per l'animazione dell tasto compra
	$(".product-buy").on("click", function() {
		var pid = this.id.split("_")[1];
		var time;
		var timerStarted = false;
		$.post("Api/Cart", { action:"add", id:pid }, function(msg){
			parseInt($("#cart-quantity").text(parseInt($("#cart-quantity").text())+1));
			$("#productadd_"+pid).parent().parent().addClass("clicked");
			$("#productadd_"+pid).parent().parent().one("mouseout", function(){
				time = setTimeout(() => {
					$("#productadd_"+pid).parent().parent().removeClass("clicked");
					timerStarted = true;
				}, 3000);
			});
			$("#productadd_"+pid).parent().parent().on("mouseover", function(){
				if(timerStarted) {
					$("#productadd_"+pid).parent().parent().off("mouseover")
				} else {
					clearTimeout(time);
					$("#productadd_"+pid).parent().parent().one("mouseout", function(){
						time = setTimeout(() => {
							$("#productadd_"+pid).parent().parent().removeClass("clicked");
							console.log("out");
							timerStarted = true;
						}, 3000);
					});
				}
			});
		});
	});
	
	// Script per l'animazione dell tasto rimuovi
	
	$(".product-remove").on("click", function() {
		var pid = this.id.split("_")[1];
		$.post("Api/Cart", { action:"remove", id:pid }, function(msg){
			parseInt($("#cart-quantity").text(parseInt($("#cart-quantity").text())-1));
			$("#productadd_"+pid).parent().parent().removeClass("clicked");
		});
	});
	</script>
</z:layout>