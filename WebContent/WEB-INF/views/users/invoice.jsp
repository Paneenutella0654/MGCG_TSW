<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />

<link href="resources/css/user-profile.css" rel="stylesheet" type="text/css">
<link href="resources/css/invoice2.css" rel="stylesheet" type="text/css">

<script src="resources/script/invoiceDow.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>

<z:layout pageTitle="Invoice"> 
<header>
	
	<div>
			<div class="d_button">
                <button class="links" id="download"> Download PDF</button>
        	</div>
        	<c:if test="${pdf}">
        		<input type="hidden" id="pdf" value="download">
        	</c:if>
        	
        	
        	
			<h1>Invoice</h1>
			<address >
				<p>Gerardo Frino</p>
				<p>101 E. Chapman Ave<br>Orange, CA 92866</p>
				<p>(800) 555-1234</p>
			</address>
			<span><img alt="Logo" src="/MGCG/resources/images/logo.png"><input type="file" accept="image/*"></span>
		</header>
		<article>
			<h1>Recipient</h1>
			<address >
				<p>Some Company<br>c/o Some Guy</p>
			</address>
			<table class="meta">
				<tr>
					<th><span  >Invoice #</span></th>
					<td><span  >101138</span></td>
				</tr>
				<tr>
					<th><span  >Data</span></th>
					<td><span  >January 1, 2012</span></td>
				</tr>
				<tr>
					<th><span  >Amount Due</span></th>
					<td><span id="prefix"  >$</span><span>${orderToShow.getTotalPaidString() }</span></td>
				</tr>
			</table>
			<table class="inventory">
				<thead>
					<tr>
						<th><span  >Description</span></th>
						<th><span  >Quantita</span></th>
						<th><span  >Prezzo Unitario</span></th>
						<th><span  >Sconto</span></th>
						<th><span  >Totale</span></th>
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
			<table class="balance">
				<tr>
					<th><span  >Total</span></th>
					<td><span data-prefix>$</span><span>${orderToShow.getTotalPaidString()}</span></td>
				</tr>
				<tr>
					<th><span  >Amount Paid</span></th>
					<td><span data-prefix>$</span><span  >0.00</span></td>
				</tr>
				<tr>
					<th><span  >Balance Due</span></th>
					<td><span data-prefix>$</span><span>${orderToShow.getTotalPaidString()}</span></td>
				</tr>
			</table>
		</article>
		<aside>
			<h1><span  >Additional Notes</span></h1>
			<div  >
				<p>A finance charge of 1.5% will be made on unpaid balances after 30 days.</p>
			</div>
		</aside>
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