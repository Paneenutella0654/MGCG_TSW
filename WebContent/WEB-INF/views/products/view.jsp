<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<z:layout pageTitle="Product View">

<link href="<c:url value="/resources/css/product-view.css"/>" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/smooth-zoom@latest/dist/zoom.browser.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/okZoomn.js"></script>  <!-- Va messo okZoom per funzionare -->



<!-- <script src="node_modules/smooth-zoom/dist/zoom.browser.js"></script> 	 -->
 
	<!-- Page to view details of a product -->
	<div id="notification" class="notification is-hidden"><button class="delete" onclick="closeNotification()">X</button><span id="notification-text">Test</span></div>
	<div class="products">
		<div class="product">
			<div class="left">
				<div class="images-big">
					<img id="big-img" src="/MGCG/resources/images/products/${prod.getId()}.jpg">
				</div>
			</div>
			<div class="right">
				<div class="product-title">
					<h1 class="is-size-2 has-text-weight-bold">${prod.getName()}</h1>
				</div>
				<div class="product-description mt-4">
					<p>${prod.getDescription()}</p>
					<p>${prod.getPrice()}</p>
				</div>
	
				<div class="product-action mt-4">
					<form action="Cart" method="post">
						<input type="hidden" name="action" value="add">
						<input type="hidden" name="id" value="${prod.getId()}">
						<button type="submit" class="button is-success" style="width:100%">Aggiungi</button>
					
					</form>
					<c:if test="${user != null}">
						<button class="button is-primary mt-2" onclick="openModal()">Recensione</button>
					</c:if>
				</div>
			</div>
		</div>
		
		
		<div class="modal">
		  <div class="modal-background"></div>
		  <div class="modal-card">
		    <header class="modal-card-head">
		      <p class="modal-card-title">Nuova Recensione</p>
		      <button class="delete" aria-label="close" onclick="closeModal()"></button>
		    </header>
		    <section class="modal-card-body">
		      <form action="Products" method="post" id="reviewForm">
		      	<input type="hidden" name="pid" id="pid" value="${prod.getId()}">
		      	<input type="hidden" name="action" id="action" value="review">
		      	<input type="hidden" name="score" id="score" value="4">
		      	<label class="label">Valutazione generale</label>
		      	<i class="fa fa-star fa-2x is-clickable has-text-warning" id="1-star" onclick="starClicked(this)"></i>
		      	<i class="fa fa-star fa-2x is-clickable has-text-warning" id="2-star" onclick="starClicked(this)"></i>
		      	<i class="fa fa-star fa-2x is-clickable has-text-warning" id="3-star" onclick="starClicked(this)"></i>
		      	<i class="fa fa-star fa-2x is-clickable has-text-warning" id="4-star" onclick="starClicked(this)"></i>
		      	<i class="fa fa-star fa-2x is-clickable has-text-white-ter" id="5-star" onclick="starClicked(this)"></i>
		      	<label class="label">Aggiungi un titolo</label>
		      	<input class="input" type="text" name="title" id="title">
		      	<label class="label">Aggiungi una recensione</label>
		      	<textarea class="textarea" name="body" id="body" placeHolder="Descrivi il prodotto..."></textarea>
		      </form>
		    </section>
		    <footer class="modal-card-foot">
		      <button class="button is-success" id="reviewSubmit">Invia</button>
		      <button class="button is-danger" onclick="closeModal()">Elimina</button>
		    </footer>
		  </div>
		</div>
	</div>
	
	
	
	<hr>
	<div class="additional-info">
			<div class="reviews">
				<c:forEach items="${prod.getReviewes()}" var="review"> 
				<div id="review_${review.getId()}" class="single-review">
					<div class="rev-title">
						<span class="rev-score"><c:forEach var="i" begin="1" end="${review.getScore()}" ><i class="fa fa-star" style="color: #56BFBA"></i></c:forEach></span>
						<h3 class="has-text-weight-bold">${review.getTitle()}</h3>
					</div>
					<div class="rev-text">
						<div id="rev-body"><p>${review.getBody() }<p></div>
						<div id="rev-user"><i class="fa fa-user ml-2 mt-2"> ${review.getUser().getEmail()}</i></div>
						<div id="rev-actions"></div>
					</div>
					<c:if test="${review.getReply() != null}">
						<hr>
						<div class="rev-reply">
							<em>MGCG replied:</em>
							<p>${review.getReply() }</p>
						</div>
					</c:if>	
				</div>
				</c:forEach>
			</div>
		</div>
	
	
	
	
	<script>
	
		// Script per la gestione delle recensioni 
		function submitForm(){
			$("#reviewForm").submit();
			$(".modal").removeClass("is-active");
		}
		function openModal(){
			$(".modal").addClass("is-active");
		}
		
		function closeModal(){
			$(".modal").removeClass("is-active");
		}
		
		function closeNotification() {
			$("#notification").addClass("is-hidden");
		}
		// Script per le stellette delle recensioni 
		
		function starClicked(star){
			var score = parseInt(star.id.split("-")[0]);
			$("#score").val(score);
			for(i = 1; i <= score; i++){  //ciclo che trasforma le stelletta da bianco a giallo aggiungendo e rimuovendo le oppurtune classi
				$("#"+i+"-star").removeClass("has-text-white-ter")
				$("#"+i+"-star").addClass("has-text-warning")
			}
			for(i = score + 1; i <=5; i++) {    //ciclo che trasforma le stelletta da giallo a bianco aggiungendo e rimuovendo le oppurtune classi
				$("#"+i+"-star").removeClass("has-text-warning")
				$("#"+i+"-star").addClass("has-text-white-ter")
			}
		}
		
		
		// Script pre le recenzioni
		
		$(document).ready(function() {
			let c;
			$("#reviewSubmit").click(function() {
				var pid = $("#pid").val();
				var title = $("#title").val();
				var body = $("#body").val();
				var score = $("#score").val();
				var action = $("#action").val();
				var did = undefined;
				$.ajax ({
					type: "POST",
					url: "Products",
					data: {"pid": pid, "action":action, "title":title,"body":body,"score":score },
					dataType: "json",
					success: function(data) {
						closeModal();
						$("#notification-text").text("Grazie per la recensione");  //Modifica al DOM
						$("#notification").addClass("is-success");
						$("#notification").removeClass("is-hidden");
					},
					error: function(data, s, v){
						closeModal();
						if(data.responseJSON.message.match(/duplicate/i)){
							$("#notification-text").text("You've already made a review for this product");	
						} else if (data.responseJSON.message.match(/unauthenticated/i)) {
							$("#notification-text").text("You must login to make a review");
						} else {
							$("#notification-text").text(data.responseText.message);
						}
						$("#notification").addClass("is-danger");
						$("#notification").removeClass("is-hidden");
					}
				});
			});

		});		
	</script>
</z:layout>