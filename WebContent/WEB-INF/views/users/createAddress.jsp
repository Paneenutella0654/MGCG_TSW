<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<z:layout pageTitle="Add Address">
	<h3 class="is-size-4">Inserisci il nuovo Indirizzo</h3>
	<form class="mt-4" action="User" method="post" onsubmit="event.preventDefault(); myfunction(this)">
		<input type="hidden" name="action" value="createAddress">
		
		<div class="form-group">
			<label for="firstName">Nome</label>
			<input type="text" class="form-control input" name="firstName" id="firstName" aria-describedby="firstNameHelp"
				placeholder="Nome destinatario" required>
		</div>
			
		<div class="form-group">
			<label for="lastName">Cognome</label>
			<input type="text" class="form-control input" name="lastName" id="lastName" aria-describedby="lastNameHelp"
				placeholder="Cognome destinatario" required>
		</div>
				
		<div class="form-group">
			<label for="address">Indirizzo</label>
			<input type="text" class="form-control input" name="address" id="address" aria-describedby="addressHelp"
				placeholder="Indirizzo di destinazione e numero civico" required>
		</div>
			
		<div class="form-group">
			<label for=postalCode>CAP</label>
			<input type="text" class="form-control input" name="postalCode" id="postalCode" aria-describedby="postalCodeHelp"
				placeholder="CAP di destinazione" required>
		</div>
	
		<div class="form-group">
			<label for="city">Citta</label>
			<input type="text" class="form-control input" name="city" id="city" aria-describedby="cityHelp"
				placeholder="Citta di destinazione" required>
				
		</div>
			
		<div class="form-group">
			<label for="province">Provincia</label>
			<input type="text" class="form-control input" name="province" id="province" aria-describedby="provinceHelp"
				placeholder="Sigla Provincia" required>
		</div>
			
		
		<div class="form-group">
			<label for="phone"> Num Telefono</label>
			<input type="text" class="form-control input" name="phone" id="phone" aria-describedby="phoneHelp"
				placeholder="Numero di telefono di riferimento">
		</div>
		
		<div class="form-group">
			<label for="info"> Informazioni aggiuntive</label>
			<input type="text" class="form-control input" name="info" id="info" aria-describedby="infoHelp"
				placeholder="Informazioni aggiuntive per la consegna">
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
				placeholder="Inserisci un alias per questo indirizzo" required>
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