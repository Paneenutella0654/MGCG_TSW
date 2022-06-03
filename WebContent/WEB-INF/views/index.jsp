<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="resources/css/product.css" rel="stylesheet" type="text/css">
<link href="resources/css/home.css" rel="stylesheet" type="text/css">
<z:layout pageTitle="MCGC Autoricambi">
	
	<div>
		<h1 class="is-size-3-desktop is-size-5-tablet has-text-centered">MGCG il luogo dove trovi tutto</h1>
	</div>
	
	<img id="store" alt="BIG PHOTO OF STORE" src="resources/images/home.jpg">
	
	
	<div>
		<video autoplay="" muted="" loop="" playsinline="" width="400">
			<source src="resources/video/video.mp4" type="video/mp4">
		</video>	
	</div>
	
	<div class="main col-md-6" id="coloumn1">
    	<div class="row" id="car">
        	<div class="desc_img_cont_in">
           		<img class="img-responsive desc_img" src="resources/images/car.png" />
        	</div>
       		<div class="desc_txt_in">
            	<h2 class="title_text2">Autoricambi.</h2>
            <p class="par">Mgcg, composta da professionisti attivi da piu di 20 anni nel settore
            e si occupa di reintrodurre nel mercato i ricambi riutilizzabili degli autoveicoli.</p>
        </div>
    </div>

    <!--RISPARMIO-->
    <div class="row" id="euro">
        <div class="desc_img_cont_in">
                <img class="img-responsive desc_img" src="resources/images/euro.png"/>
        </div>
        <div class="desc_txt_in">
            <h2 class="title_text2">Risparmio</h2>
            <p class="par">Fiducia, qualit� e risparmio sono i principi su cui puntiamo per creare un rapporto solido con i clienti, 
            sia privati che professionisti del settore.</p>
        </div>
    </div>
    

    <!--RICICLO-->
    <div class="row" id="reciclo">
        <div class="desc_img_cont_in">
            <img class="img-responsive desc_img" src="resources/images/riciclo.png" />
        </div>
        <div class="desc_txt_in">
            <h2 class="title_text2">Riciclo</h2>
            <p class="par"> Ogni ricambio funzionante, recuperato e riutilizzato, comporta la diminuzione della produzione industriale di ricambi nuovi,
            alleviando in questo modo l'��impatto ambientale.</p>
        </div>
    </div>
</div>	  
</z:layout> 