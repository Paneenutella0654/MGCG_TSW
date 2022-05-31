<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<z:layout pageTitle="Add Address">
	<h3>Inserisci il nuovo Indirizzo</h3>
	<form class="mt-4" action="User" method="post" onsubmit="event.preventDefault(); myfunction(this)">
		<input type="hidden" name="action" value="createAddress">
		
		<div class="form-group">
			<label for="firstName">Nome</label>
			<input type="text" class="form-control input" name="firstName" id="firstName" aria-describedby="firstNameHelp"
				placeholder="Mario..." required>
				<small id="firstNameHelp" class="form-text text-muted">Nome destinatario</small>
				</div>
			
		<div class="form-group">
			<label for="lastName">Cognome</label>
			<input type="text" class="form-control input" name="lastName" id="lastName" aria-describedby="lastNameHelp"
				placeholder="Rossi..." required>
				<small id="lastNameHelp" class="form-text text-muted">Cognome destinatario</small>
		</div>
				
		<div class="form-group">
			<label for="address">Indirizzo</label>
			<input type="text" class="form-control input" name="address" id="address" aria-describedby="addressHelp"
				placeholder="Via Roma, 12/A..." required>
				<small id="lastNameHelp" class="form-text text-muted">Indirizzo di destinazione e numero civico</small>
		</div>
			
		<div class="form-group">
			<label for=postalCode>CAP</label>
			<input type="text" class="form-control input" name="postalCode" id="postalCode" aria-describedby="postalCodeHelp"
				placeholder="84100" required>
				<small id="postalCodeHelp" class="form-text text-muted">CAP di destinazione</small>
		</div>
	
		<div class="form-group">
			<label for="city">Citta</label>
			<input type="text" class="form-control input" name="city" id="city" aria-describedby="cityHelp"
				placeholder="Milano..." required>
				<small id="lastNameHelp" class="form-text text-muted">Citta di destinazione</small>
		</div>
			
		<div class="form-group">
			<label for="province">Provincia</label>
			<input type="text" class="form-control input" name="province" id="province" aria-describedby="provinceHelp"
				placeholder="MI..." required>
				<small id="provinceHelp" class="form-text text-muted">Sigla Provincia</small>
		</div>
			
		
		<div class="form-group">
			<label for="phone"> Num Telefono</label>
			<input type="text" class="form-control input" name="phone" id="phone" aria-describedby="phoneHelp"
				placeholder="3929009...">
			<small id="phoneHelp" class="form-text text-muted">Numero di telefono di riferimento</small>
		</div>
		
		<div class="form-group">
			<label for="info"> Informazioni aggiuntive</label>
			<input type="text" class="form-control input" name="info" id="info" aria-describedby="infoHelp"
				placeholder="Cancello verde di fronte alla banca...">
			<small id="infoHelp" class="form-text text-muted">Informazioni aggiuntive per la consegna</small>
		</div>
		
		<hr>
		
		<div class="form-check mb-3">
			<input class="form-check-input" type="checkbox" value="" name="preferred" id="preferred">
			<label class="form-check-label" for="preferred">
				Preferenza
			</label>
		</div>
		
		<div class="form-group">
			<label for="alias"></label>
			<input type="text" class="form-control input" name="alias" id="alias" aria-describedby="aliasHelp"
				placeholder="Home, Office..." required>
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