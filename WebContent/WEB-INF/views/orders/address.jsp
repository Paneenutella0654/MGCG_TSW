<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<z:layout pageTitle="Login">
	<h1>Inserisci i dati per la spedizione</h1>
	<form class="mt-4" action="User" method="post">
		<input type="hidden" name="action" value="createAddress">
		<div class="row">
			<div class="col">
				<div class="form-group">
					<label for="firstName">Nome</label>
					<input type="text" class="form-control" name="firstName" id="firstName" aria-describedby="firstNameHelp"
						placeholder="Mario..." required>
					<small id="firstNameHelp" class="form-text text-muted">Nome di destinazione</small>
				</div>
			</div>
			<div class="col">
				<div class="form-group">
					<label for="lastName">Cognome</label>
					<input type="text" class="form-control" name="lastName" id="lastName" aria-describedby="lastNameHelp"
						placeholder="Rossi..." required>
					<small id="lastNameHelp" class="form-text text-muted">Cognome destinazione</small>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-8">
				<div class="form-group">
					<label for="address">Indirizzo</label>
					<input type="text" class="form-control" name="address" id="address" aria-describedby="addressHelp"
						placeholder="Via Roma, 12/A..." required>
					<small id="lastNameHelp" class="form-text text-muted">Indirizzo di destinazione e numero civico</small>
				</div>
			</div>
			<div class="col">
				<div class="form-group">
					<label for=postalCode>CAP</label>
					<input type="text" class="form-control" name="postalCode" id="postalCode" aria-describedby="postalCodeHelp"
						placeholder="84100" required>
					<small id="postalCodeHelp" class="form-text text-muted">Codice postale di destinazione</small>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-8">
				<div class="form-group">
					<label for="city">Città</label>
					<input type="text" class="form-control" name="city" id="city" aria-describedby="cityHelp"
						placeholder="Milano..." required>
					<small id="lastNameHelp" class="form-text text-muted">Città di destinazione</small>
				</div>
			</div>
			<div class="col">
				<div class="form-group">
					<label for="province">Provincia</label>
					<input type="text" class="form-control" name="province" id="province" aria-describedby="provinceHelp"
						placeholder="MI..." required>
					<small id="provinceHelp" class="form-text text-muted">Abbreviazione della provincia di destinazione</small>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<label for="phone"></label>
			<input type="text" class="form-control" name="phone" id="phone" aria-describedby="phoneHelp"
				placeholder="3929009...">
			<small id="phoneHelp" class="form-text text-muted">Numero di telefono a cui fare riferimento</small>
		</div>
		
		<div class="form-group">
			<label for="info"></label>
			<input type="text" class="form-control" name="info" id="info" aria-describedby="infoHelp"
				placeholder="Cancello verde di fronte alla banca...">
			<small id="infoHelp" class="form-text text-muted">Altre info per la consegna</small>
		</div>
		
		<div class="form-check mb-3">
			<input class="form-check-input" type="checkbox" value="" name="save" id="save">
			<label class="form-check-label" for="save">
				Salva questo indirizzo
			</label>
		</div>
		
		<div class="form-group">
			<label for="alias"></label>
			<input type="text" class="form-control" name="alias" id="alias" aria-describedby="aliasHelp"
				placeholder="Home, Office..." disabled>
			<small id="Help" class="form-text text-muted">Inserisci un alias per salvare questo indirizzo</small>
		</div>
		
		<hr>
		
		<div class="form-check mb-3">
			<input class="form-check-input" type="checkbox" value="" name="isGift" id="isGift">
			<label class="form-check-label" for="isGift">
				è un regalo
			</label>
		</div>
		
		<div class="form-group">
			<label for="giftMessage"></label>
			<input type="text" class="form-control" name="giftMessage" id="giftMessage" aria-describedby="giftMessageHelp"
				placeholder="Tanti auguri di buon compleano..." disabled>
			<small id="giftMessageHelp" class="form-text text-muted">Inserisci un messaggio regalo</small>
		</div>
		
		
		<button class="btn btn-success" type="submit">Salva</button>
		
	</form>
	
	<script>
	
		$("#save").change(function() {
		    if(this.checked) {
		    	$('#alias').removeAttr("disabled");
		    	$('#alias').prop("required", true);
		    } else {
		    	$('#alias').prop("disabled", true);
		    	$('#alias').removeAttr("required");
		    }
		});
		
		$("#isGift").change(function() {
		    if(this.checked) {
		    	$('#giftMessage').removeAttr("disabled");
		    	$('#giftMessage').prop("required", true);
		    } else {
		    	$('#giftMessage').prop("disabled", true);
		    	$('#giftMessage').removeAttr("required");
		    }
		});
	</script>
	
</z:layout>