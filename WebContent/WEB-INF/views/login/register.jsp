<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<z:layout pageTitle="Register">
	<div id="notification" class="notification is-danger is-hidden"><button class="delete" onclick="closeNotification()">X</button><span id="notification-text">Test</span></div>
	<h1 class="is-size-1 has-text-weight-bold">Crea un nuovo account</h1>
	<form id="registerForm" action="Login" method="post" enctype="application/x-www-form-urlencoded">
		<input type="hidden" name="action" value="register">

		<div class="form-group">
			<label for="firstName">Nome</label>
			<input type="text" class="form-control input" name="firstName" id="firstName" aria-describedby="nameHelp"
				placeholder="Inserisci il nome" required>
			<p class="help is-danger is-hidden">Inserisci il tuo nome</p>
		</div>

		<div class="form-group">
			<label for="lastName">Cognome</label>
			<input type="text" class="form-control input" name="lastName" id="lastName" aria-describedby="nameHelp"
				placeholder="inserisci il cognome" required>
			<p class="help is-danger is-hidden">Inserisci il tuo cognome</p>
		</div>

		<div class="form-group">
			<label for="email">Email</label>
			<input type="email" class="form-control input" name="email" id="email" aria-describedby="nameHelp"
				placeholder="Inserisci Email" required>
			<p class="help is-danger is-hidden">Inserisci un Email valids</p>
		</div>
		<label for="email">Genere</label>
		<div class="control is-vcentered">
				<label class="radio" for="gender_male">
					<input  type="radio" name="gender" id="gender_male" value="Male">
				Maschio
				</label>
				<label class="radio" for="gender_female">
					<input type="radio" name="gender" id="gender_female" value="Female"> 
				Femmina
				</label>
				<label class="radio" for="gender_undefined">
					<input type="radio" name="gender" id="gender_undefined" value="Undefined" checked>
				Indefinito
				</label>
		</div>

		<div class="form-group mt-2">
			<label for="birthdayview">Data di nascita</label>
			<input type="text" class="form-control input" name="birthdayview" id="birthdayview" aria-describedby="nameHelp"	placeholder="Inserisci la data di nascita " required>
			<input id="birthday" name="birthday" type="hidden"/>
			<p class="help is-danger is-hidden">Inserisci una data di nascita valida (Devi avere almeno 14 anni)</p>
		</div>

		<div class="form-group">
			<label for="password">Password</label> <input type="password" class="form-control input" name="password"
				id="password" aria-describedby="nameHelp" placeholder="Inserisci la password" min="8" required>
			<p class="help is-danger is-hidden">La password deve essere lunga almeno 8 caratteri e deve contenere: carattere maiuscolo, carattere minuscolo, un numero</p>
		</div>

		<div class="form-group">
			<label for="confirmpassword">Conferma la Password</label>
			<input type="password" class="form-control input" name="confirmpassword" id="confirmpassword"
				aria-describedby="nameHelp" placeholder="Inserisci di nuovo la password" min="8" required>
			<p class="help is-danger is-hidden">La password non corrisponde</p>
		</div>

		<div class="form-check">
			<input class="form-check-input" type="checkbox" name="subscribe" id="subscribe">
			<label class="form-check-label" for="subscribe">Iscriviti alla newsletters</label>
		</div>

		<button type="submit" class="button is-success mt-2">Registrati ora!</button>
	</form>
	<script>
		var error = false;
		
		$("#registerForm").on('submit', function (event) {
			error = false;
			if(!isValidName($("#firstName").val())){
				invalidMessage($("#firstName"));
			}
			if(!isValidName($("#lastName").val())){
				invalidMessage($("#lastName"));
			}
			if(!isValidEmail($("#email").val())) {
				invalidMessage($("#email"));
			}
			if(!isValidDate($("#birthday").val())) {
				invalidMessage($("#birthday"));
			}
			if(!isValidPassword($("#password").val())) {
				invalidMessage($("#password"));
			}
			if(!$("#password").val() == $("#confirmpassword").val()) {
				invalidMessage($("#confirmpassword"));
			}
			var res = checkIfEmailExists($("#email").val());
			if(res.responseJSON.message == "taken"){
				error = true;
				$("#notification").removeClass("is-hidden");
				$("#notification-text").empty()
				$("#notification-text").text("Account already exists for this email");
			};
			return !error;
		});

		$("#birthdayview").datepicker({
			maxDate: "-10y",
			minDate: "-110y",
			defaultDate: "-18y",
			changeMonth: true,
			changeYear: true,
			yearRange: "-110:-10",
			altField: '#birthday',
			altFormat: "yy-dd-mm",
			onSelect: function(dateText) {
		    	$(this).removeClass("is-danger");
				$(this).next("p").addClass("is-hidden");
		    }
		})
		
		$("#firstName, #lastName, #email, #birthday, #password, #confirmpassword").on("keypress changeDate onSelect", function(event){
			$(this).removeClass("is-danger");
			$(this).next("p").addClass("is-hidden");
		})
		
		function invalidMessage(obj) {
			obj.next("p").removeClass("is-hidden");
			obj.addClass("is-danger");
			error = true;
		}

		function isValidName(name) {
			return (name.match(/^[a-z ,.'-]+$/i) && name.length > 1  && name.length <= 30)
		}

		function isValidDate(date) {
			if (!date.match(/^\d{4}[./-]\d{2}[./-]\d{2}$/)) {
				return false;
			}
			var maxDate = new Date(new Date().setFullYear(new Date().getFullYear() - 15));
			var minDate = new Date(new Date().setFullYear(new Date().getFullYear() - 110));
			var d = new Date(date);
			return (d > minDate && d < maxDate);
		}

		function isValidEmail(email) {
			return email.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/);
		}
		
		function checkIfEmailExists(email) {
			return $.ajax({
		        url: "Api/User",
		        type: 'GET',
		        async: false,
		        cache: false,
		        timeout: 30000,
		        dataType: "json",
		        data: { action:"checkEmail", email:email },
		        success: function(data){
		        	return data
		        },
		        fail: function(msg){
		            return true;
		        }
		    });
		}

		function isValidPassword(pass) {
			return pass.match(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{8,})/);
		}
		
		function closeNotification() {
			$("#notification").addClass("is-hidden");
		}
	</script>
</z:layout>