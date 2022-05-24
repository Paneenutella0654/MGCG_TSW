<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<z:layout pageTitle="Edit Address">
<h1>Modifica Indirizzo N. ${bean.getId()}</h1>

<form class="mt-4" action="User" method="post" onsubmit="event.preventDefault(); myfunction(this)">
		<input type="hidden" name="action" value="editAddress">
		<input type="hidden" name="id" value="${bean.getId()}">
			<div class="row">
			<div class="col">
				<div class="form-group">
					<label for="firstName">Nome</label>
					<input type="text" class="form-control" name="firstName" id="firstName" 
					aria-describedby="firstNameHelp" value="${bean.getFirstName()}" required>
					<small id="firstNameHelp" class="form-text text-muted">Nome destinatario</small>
				</div>
			</div>
			<div class="col">
				<div class="form-group">
					<label for="lastName">Cognome</label>
					<input type="text" class="form-control" name="lastName" id="lastName" aria-describedby="lastNameHelp" value="${bean.getLastName()}" required>
					<small id="lastNameHelp" class="form-text text-muted">Cognome destinatario</small>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-8">
				<div class="form-group">
					<label for="address">Indirizzo</label>
					<input type="text" class="form-control" name="address" id="address" aria-describedby="addressHelp" value="${bean.getAddress()}" required>
					<small id="lastNameHelp" class="form-text text-muted">Indirizzo di destinazione e numro civico</small>
				</div>
			</div>
			<div class="col">
				<div class="form-group">
					<label for=postalCode>CAP</label>
					<input type="text" class="form-control" name="postalCode" id="postalCode" aria-describedby="postalCodeHelp" value="${bean.getPostalCode()}" required>
					<small id="postalCodeHelp" class="form-text text-muted">CAP di destinazione</small>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-8">
				<div class="form-group">
					<label for="city">Città</label>
					<input type="text" class="form-control" name="city" id="city" aria-describedby="cityHelp" value="${bean.getCity()}"required>
					<small id="lastNameHelp" class="form-text text-muted">Città di destinazione</small>
				</div>
			</div>
			<div class="col">
				<div class="form-group">
					<label for="province">Provincia</label>
					<input type="text" class="form-control" name="province" id="province" aria-describedby="provinceHelp" value="${bean.getProvince()}"required>
					<small id="provinceHelp" class="form-text text-muted">Sigla Provincia</small>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<label for="phone"></label>
			<input type="text" class="form-control" name="phone" id="phone" aria-describedby="phoneHelp"value="${bean.getPhone()}">
			<small id="phoneHelp" class="form-text text-muted">Numero di telefono di riferimento</small>
		</div>
		
		<div class="form-group">
			<label for="info"></label>
			<input type="text" class="form-control" name="info" id="info" aria-describedby="infoHelp" value="${bean.getInfo()}">
			<small id="infoHelp" class="form-text text-muted">Informazioni aggiuntive per la consegna</small>
		</div>
		
		<hr>
		
		<div class="form-check mb-3">
			<input class="form-check-input" type="checkbox" value="" name="preferred" id="preferred" <c:if test="${bean.isPreferred()}">checked</c:if> >
			<label class="form-check-label" for="preferred" >
				Preferenza
			</label>
		</div>
		
		<div class="form-group">
			<label for="alias"></label>
			<input type="text" class="form-control" name="alias" id="alias" aria-describedby="aliasHelp"
				placeholder="Home, Office..." value="${bean.getAlias()}"required>
			<small id="Help" class="form-text text-muted">Inserisci un alias per questo indirizzo</small>
		</div>
		
		<hr>		
		
		<button class="btn btn-success" type="submit">Salva</button>
		
	</form>
	<script>

	function myfunction(frm) {
		if(validatecap()) {
			if(phonenumber()) {
				frm.submit();
			} else {
				alert("L'inserimento numerico non è valido");
			}
		} else {
			alert("Cap non valido");
		}
	}
	
	function validatecap() {
		var valicap=/^\d{5}$/;
		var postalCode=document.getElementById("postalCode");
		if(postalCode.value.match(valicap)) {
			return true;
		} else {
			postalCode.focus;
			return false;
		}
	}
	
	function phonenumber() {
		var input=document.getElementById("phone");
		var phoneno = /^\d{10}$/;
		if(input.value.match(phoneno)) {
			return true;
		} else {
			input.focus;
			return false;
		}
	}
</script>

</z:layout>