<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<z:layout pageTitle="Cart">
	<c:if test="${!cart.isEmpty() }">
		<h1 class="is-size-1"><i class="fa fa-shopping-cart"></i> Il tuo carrello </h1>
	</c:if>
	<c:if test="${cart.isEmpty() }">
		<h1 class="is-size-1"><i class="fa fa-shopping-cart"></i> Il tuo carrello � vuoto</h1>
	</c:if>
	<c:if test="${!cart.isEmpty() }">
		<table class="table is-fullwidth is-striped">
			<thead>
				<tr>
					<th></th>
					<th>Nome</th>
					<th>Prezzo</th>
					<th>Prezzo totale</th>
					<th>Quantita</th>
					<th>Azione</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${cart.getProducts()}" var="bean">
				<tr>
					<td>
						<figure class="image is-128x128">
							<img class="is-rounded" src="https://source.unsplash.com/120x120/?sig=${bean.getId()}&bouquet">
						</figure>
					</td>
					<td class="is-size-4 has-text-weight-medium">${bean.getProduct().getName() }</td>
					<td>&euro; <span id="price_${bean.getId()}">${bean.getProduct().getPriceToString()}</span></td>
					<td>&euro; <span id="totalprice_${bean.getId()}">${bean.getTotalPriceToString()}</span></td>
					<td><input type="number" class="input" id="quantity_${bean.getId()}" name="quantity[]" min="1" value="${bean.getQuantity()}"></td>
					<td>
						<form action="Cart" method="post">
							<input type="hidden" id="updid_${bean.getId()}" name="id" value="${bean.getId()}">
							<input type="hidden" id="updaction_${bean.getId()}" name="action" value="update">
							<button id="btnupdate_${bean.getId()}" name="btnupdate[]" class="button is-info is-fullwidth" disabled>Aggiorna</button>
						</form>
						<form action="Cart" method="post">
							<input type="hidden" id="delid_${bean.getId()}" name="id" value="${bean.getId()}">
							<input type="hidden" id="delaction_${bean.getId()}" name="action" value="remove">
							<button id="btndelete_${bean.getId()}" name="btnremove[]" class="button is-danger is-fullwidth mt-2">Elimina</button>
						</form>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<c:if test="${!cart.isEmpty() && cart!=null}">
		<div class="field is-grouped">
			<form action="Cart" method="post">
				<input type="hidden" id="action_remove" name="action" value="removeAll">
				<button class="button is-danger">Rimuovi tutto</button>
			</form>
			
			<form action="Login" method="get" >
				<input type="hidden" id="action_buy" name="action" value="checkout">
				<button class="button is-success ml-4" type="submit">Compra ora!</button>			
			</form>
		</div>
		</c:if>
	</c:if>
	
	
	<script>
		let defaultQuantity = new Map();
		$(document).ready(function() {
			$("[name^=quantity]").each(function() {
				defaultQuantity.set($(this)[0].id.split("_")[1], $(this).val());
			});
			
			$("[name^=quantity]").on("change", function(event) {
				if(defaultQuantity.get($(this)[0].id.split("_")[1]) == $(this).val())
					$("#btnupdate_" + $(this)[0].id.split("_")[1]).attr("disabled", true);
				else
					$("#btnupdate_" + $(this)[0].id.split("_")[1]).removeAttr("disabled");
			});
			
			$("[name^=btnupdate]").on("click", function(event) {
				var id = $(this)[0].id.split("_")[1];
				var quantity = parseInt($("#quantity_" + id).val());
				var price = parseFloat($("#price_" + id).text().replace(",","."));
				event.preventDefault();
				$.ajax ({
					type: "POST",
					url: "Cart",
					data: {"id": id, "action":"update", "quantity": quantity },
					success: function(result) {
						$("#totalprice_"+id).text((quantity * price).toFixed(2));
						defaultQuantity.set(id,quantity);
						$("#btnupdate_" + id).attr("disabled", true);
					},
					error: function(result){
						alert("error");
					}
				});
			});
		});
	</script>	
	
</z:layout>