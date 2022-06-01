<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="resources/css/user-profile.css" rel="stylesheet" type="text/css">
<z:layout pageTitle="MyData">
 
  
	<h1 class="is-size-1 has-text-weight-semibold">Ciao! ${user.getFirstName()} </h1>
	<div class="user-profile">
		<div class="user-profile-menu">
			<ul>
				<li>
					<h2 class="title">Account</h2>
				</li>
				<li>
					<a href="User?action=viewData">
						<p>Data</p>
					</a>
				</li>
				<li>
					<a href="User?action=viewOrders" class="active">
						<p>Ordini</p>
					</a>
				</li>
				<li>
					<a href="User?action=viewAddresses" class="active">
						<p>Indirizzo</p>
					</a>
				</li>
			</ul>
			<a class="user-logout" href="Login?action=logout">Logout</a>
		</div>

		<div class="right">
			
			
			
			<div class="data">
				<div class="avatarDiv">
					<c:if test="${user.isFemale()}">
						<img class="avatarImag" 
								src="${pageContext.request.contextPath}/resources/images/userAvatar/img_avatarFemale.png">
					</c:if>
					<c:if test="${!user.isFemale()}">
						<img class="avatarImag"
								src="${pageContext.request.contextPath}/resources/images/userAvatar/img_avatarMale.png">
					</c:if>
				 </div>
				  
				  <div>
				  	<p>Profilo</p>
				  		<table >
							<tr>
							  <th class="spaceA">Nome: </th>
							  <th class="space">${user.getFirstName() }</th>							  							  
							</tr>
							<tr>
							  <th class="spaceA">Cognome: </th>
							  <th class="space">${user.getLastName() }</th>							  
							</tr>
							<tr>
							  <th class="spaceA">Compleanno: </th>
							  <th class="space">${user.getBirthday()}</th>							  
							</tr>
							<tr>
							  <th class="spaceA">Email: </th>
							  <th class="space">${user.getEmail()}</th>							  
							</tr>
							<tr>
							  <th class="spaceA">Password: </th>
							  <th class="space">********</th>							  
							</tr>
							<tr>
							  <th class="spaceA">Ruolo: </th>
							  <th class="space">${user.getRole()}</th>							  
							</tr>
							</table>
				  </div>
				 
				
			</div>
		</div>
	</div>
</z:layout>