<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<z:layout pageTitle="Admin Order View">

  
  <p>ID ORDINE         		:<b>${bean.getId()}</b> <p> 
  <p>User  ID         		:<b>${bean.getUser().getId()}</b> </p>
  <p>Destinazione     		:<b>${bean.getDestination()}</b> </p>
  <p>Totale Prodotti   		:<b>${bean.getTotalProducts()}</b> </p>
  <p>Total Pagato      		:<b>${bean.getTotalPaid()}</b> </p>
  <p>Numero di spedizione	:<b>${bean.getTrackNumber()}</b> </p>
  <p>Regalo			 		 :<b>${bean.getGiftMessage()}</b> </p>
<table style="width:100%">
  <tr>
    <th>Nome</th>
    <th>Descrizione</th>
    <th>Prezzo</th> 
    <th>Sconto</th>
    <th>Quantità</th>
    <th>Id</th>
    <th>IdOrdine</th>
  </tr>
  <c:forEach items="${bean.getItems()}" var="item">
  <tr>
    <td>${item.getName()}</td>
    <td>${item.getDescription()}</td>
    <td>${item.getPrice()}<td>
    <td>${item.getDiscount()}</td>
    <td>${item.getQuantity()}</td>
    <td>${item.getId()}</td>
    <td>${item.getOid()}</td>
  </tr>
  </c:forEach>		
</table>
</z:layout>
