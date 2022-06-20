<%@ tag body-content="scriptless"%>
<%@ attribute name="pageTitle" required="true" type="java.lang.String"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
	<meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="http://fonts.cdnfonts.com/css/playlist" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.2/css/bulma.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link href="<c:url value="/resources/css/layout.css"/>" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" href="./resources/images/shortcuticon.ico">
	<title>${pageTitle}</title>
</head> 

<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://kit.fontawesome.com/442bbb4090.js" crossorigin="anonymous"></script>
	<!-- Navbar -->
   
	<div id="navbar" class="main-bar">
        <nav>
            <input type="checkbox" id="check">
            <label class="checkbtn" for="check">
                <span></span>
                <span></span>
                <span></span>
            </label>
            
            
            <div class="logo-header">
                <a href="<c:url value="/Home"/>">MGCG</a>
            </div>

            <ul>
                <li ${active.equals("Home") ? "class='active'": ""}><a href="<c:url value="/Home"/>">Home</a></li>
				<li ${active.equals("Products") ? "class='active'": ""}><a href="<c:url value="/Products?action=search&searchVal=auto&active=Products"/>">Prodotti</a></li>
                <li ${active.equals("Offerte") ? "class='active'": ""}><a href="<c:url value="/Products?action=search&searchVal=offerta&active=Offerte"/>">Offerte</a></li>
                <li ${active.equals("Cart") ? "class='active'": ""}><a href="<c:url value="/Cart"/>">
                	<i class="fa fa-shopping-bag fa-2x"></i>
                	(<span id="cart-quantity">${cart == null ? 0:cart.getTotalProductsQuantity() }</span>)
                </a>
                <c:if test="${user == null && admin == null}">
                	<li ${active.equals("Login") ? "class='active'": ""}><a href="<c:url value="/Login"/>">Login</a></li>
                </c:if>
                <c:if test="${user != null}">
                	<li ${active.equals("User") ? "class='active'": ""}><a href="<c:url value="/User"/>">Profilo</a></li>
                </c:if>
                <c:if test="${admin != null}">
                	<li ${active.equals("Admin") ? "class='active'": ""}><a href="<c:url value="/Admin"/>">Panello Admin</a></li>
                </c:if>
            </ul>
        </nav>
    </div>

	<!-- Navbar -->
	<main>
		<div class="container">
			<jsp:doBody />
		</div>
	</main>
	
	<script>
	//Quando l'utente scorre la pagina, eseguire myFunction
	window.onscroll = function() {myFunction()};

	// Prendi la barra di navigazione
	var navbar = document.getElementById("navbar");

	// Ottieni la posizione di offset della barra di navigazione
	var sticky = navbar.offsetTop;

	/* Aggiungi la classe sticky alla barra di navigazione quando raggiungi la sua posizione
	di scorrimento. Rimuovi sticky quando esci dalla posizione di scorrimento*/
	function myFunction() {
	  if (window.pageYOffset >= sticky) {
	    navbar.classList.add("sticky")
	  } else {
	    navbar.classList.remove("sticky");
	  }
	}
	</script>
	<!-- Footer colors  -->
	<div class="footer">
		<div class=footer-left>
			<a href="#facebook"><i class="fa fa-facebook fa-2x"></i></a>
			<a class="ml-2" href="#twitter"><i class="fa fa-twitter fa-2x"></i></a>
			<a class="ml-2" href="#instagram"><i class="fa fa-instagram fa-2x"></i></a>
		</div>
		<div class=footer-fill> 

		</div>
		<!-- Copyright -->  
		<div class="footer-right">
			<a class="anchorMgcg" href="<c:url value="/Home"/>">@2022 Copyright: MGCG Software house</a>
		</div>
	</div>
	<!-- Footer -->
</body>

</html>