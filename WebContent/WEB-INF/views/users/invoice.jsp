<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />

<link href="resources/css/user-profile.css" rel="stylesheet" type="text/css">
<link href="resources/css/invoice.css" rel="stylesheet" type="text/css">

<script src="resources/script/invoiceDow.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>

<z:layout pageTitle="Invoice"> 

	<div class="container">
           
            <div class="d_button">
                <button class="links" id="download"> Download PDF</button>
        	</div>
        	<c:if test="${pdf}">
        		<input type="hidden" id="pdf" value="download">
        	</c:if>
        	
  	<div id="invoice">
       		<h1 class="invoice">Invoice</h1>
        	<div class="information_mgcg">
        		<p class="mgcg_firm">Fattura</p>
        		<span>
        			Gerardo Frino CEO MGCG <br>
	        		Sant'andrea di Conza AV 83053 <br>
	        		+39 3287611874 // 082735658
 				</span>
	        	 	<div class="billing_time">
							<c:set var = "now" value = '<%= new java.util.Date()%>' />
							<p class="par_right" >
								Data Fattura : <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${now}" />
			        		</p>	
	        		</div>
      		</div> 
       			
        	<div class="information_invoice">
        		
        	  <div class="time">	
        		<c:set var = "orderDate" value = "${orderToShow.getCreateDate()}" />
        		<p>Ordine eseguito il : <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${orderDate}" /></p>
        	     <p>${orderToShow.getDestination()}</p>
        	      <p>Dettagli Utente: </p>
	        	  	   <div class="pad">
	        	  	   	<p> ${user.getFirstName()}</p>
	        	 	    	<p>  ${user.getLastName()}</p>
	        	 	     		<p>  ${user.getEmail()}</p> 
	        	 	    </div>         	     
        	  </div>	
        	       
                    <div class="table-responsive">
                       <div class="div_table1">
                        <table class="table table-lg">
                            <thead>
                                <tr>
                                    <th>Descrizione</th>
                                    <th>Quantità</th>
                                    <th>Prezzo unitario</th>
                                    <th>Sconto</th>
                                    <th>Totale</th>
                                </tr>
                            </thead>
                            <tbody>
                            
                            	<c:forEach items="${orderToShow.getItems() }" var="items" >
                                <tr>
                                    <td>
	                                        <p class="mb-0">${items.getName()}
	                                        				<br> ${items.getShortDescription()} </p>
                                    </td>
                                    <td>${items.getQuantity()}</td>
                                    <td>${items.getPriceString()}</td>
	                                <td>${items.getDiscountString()}</td>                             
                                    <td><span class="font-weight-semibold"> 
                                    		${items.getPrice()*items.getQuantity()} </span></td>
                                </tr> 
                               </c:forEach>   
                                   
                            </tbody>
                        </table>
                      </div>
                    </div>
                    
                    

                            <div class="div_table2">
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <th class="text-left">Subtotal:</th>
                                                <td class="text-right">${orderToShow.getTotalPaidString() }</td>                                               
                                            </tr>
                                            <tr>
                                                <th class="text-left">Tasse: <span class="font-weight-normal">(22%)</span></th>
                                                <td class="text-right">TODO</td>
                                            </tr>
                                            <tr>
                                                <th class="text-left">Totale:</th>
                                                <td class="text-right text-primary">
                                                    <h5 class="font-weight-semibold">${orderToShow.getTotalPaidString()}</h5>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="text-left">Fattura #</th>
                                                <td class="text-right text-primary">
                                                    <h5 class="font-weight-semibold" id="track">${orderToShow.getTrackNumber()}</h5>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                             </div>       
                                

                            	</div>
 	</div>		   	 		
 	
 		<div class="d_button" > <button  id="send" type="button" class="links"><b>
		    <i class="fa fa-paper-plane-o mr-1"></i></b>Inviare la fattura</button> 
		</div>	
 		
 		<div class="footer_B">
				 <span class="text-muted">A cura del servizio finanziario Mgcg</span>
		</div>
		
 </div>



<script type="text/javascript">
 
$(window).on("load" , function () {
	if($("#pdf").val() == "download" ){
		$("#download").click(); 
		setTimeout (window.close, 850);
	}
});
	 
</script>


</z:layout>