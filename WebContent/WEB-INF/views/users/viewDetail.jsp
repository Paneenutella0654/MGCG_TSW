<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />

<link href="resources/css/user-profile.css" rel="stylesheet" type="text/css">
<link href="resources/css/invoice2.css" rel="stylesheet" type="text/css">

<script src="resources/script/invoiceDow.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>

<z:layout pageTitle="Order Details"> 

<div class="containerDetails" >  	
  	<div id="invoice">
       		<header>
       		<h1>Dettagli Ordine</h1>
			<address >
				<p>${user.getFirstName()}  ${user.getLastName()}</p>
				<p>${user.getEmail()}</p>
			</address>
			<span><img alt="" src="/MGCG/resources/images/Logo.pbg"><input type="file" accept="image/*"></span>
       			</header>
        	<div class="information_invoice">
        	       
                    <div class="table-responsive">
                       <div class="div_table1">
                        <table class="table table-lg">
                            				<thead>
					<tr>
						<th><span>Item</span></th>
						<th><span>Quantita</span></th>
						<th><span>Prezzo Unitario</span></th>
						<th><span>Sconto</span></th>
						<th><span>Totale</span></th>
					</tr>
				</thead>
                           <tbody>
                            
                            	<c:forEach items="${orderToShow.getItems() }" var="items" >
                                <tr>
                                    <td>
	                                        <p class="mb-0">${items.getName()}</p>
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
                    
                    <br>
                    <br>

                            <div class="div_table2">
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <th class="text-left">Subtotal:</th>
                                                <td class="text-right">${orderToShow.getTotalPaid()-orderToShow.getTotalPaid()*22/100 }</td>                                               
                                            </tr>
                                             <tr>
                                                <th class="text-left">Aliquota: <span class="font-weight-normal"></span></th>
                                                <td class="text-right">22%</td>
                                            </tr>
                                            <tr>
                                                <th class="text-left">Tasse: <span class="font-weight-normal"></span></th>
                                                <td class="text-right">${orderToShow.getTotalPaid()*22/100 }</td>
                                            </tr>
                                            <tr>
                                                <th class="text-left">Totale:</th>
                                                <td class="text-right text-primary">
                                                    <h5 class="font-weight-semibold">${orderToShow.getTotalPaidString()}</h5>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                             </div>       
                            </div>
 						</div>
 	
 		<div>
 			<form method="get" action="User">
				<button class="links" style="margin-top: 20px" id="back">Indietro</button>
			</form>
 		</div>
</div>

</z:layout>