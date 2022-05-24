<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isErrorPage="true" %>


<link href="resources/css/product.css" rel="stylesheet" type="text/css">

<link href="<c:url value="/resources/css/error.css"/>" rel="stylesheet" type="text/css">	
<z:layout pageTitle="ErrorPage500">



		<div  >	
			
			<h1 class="error-code">500</h1>
			<p class="error">Ops! Qualcosa è andato storto.</p>
			<p class="error">Prova ad aggiornare questa pagina o non esitare a contattarci se il problema persiste.</p>
			
		</div>
	
		
		<form method="get" action="Home">
			<button  class="btn btn-success mt-2" >Indietro</button>
		</form>
            
            
            <div class="objects">
                <img class="object_face_rocket" src="${pageContext.request.contextPath}/resources/images/error/triste.png" width="80px">
           
                <div class="box_face">
                    <img class="object_face" src="${pageContext.request.contextPath}/resources/images/error/triste.png" width="140px">
            </div>
            
            
            
            </div>
            


</z:layout>