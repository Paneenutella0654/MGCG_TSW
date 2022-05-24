<%@taglib prefix="z" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<z:layout pageTitle="Login">

    <link href="layout.css" rel="stylesheet" type="text/css">

    <div class="login">
    <form action="Login" method="post" enctype="application/x-www-form-urlencoded">
      <div class="login-header">
        <img id= "logo" src="./resources/images/logo.png" alt="logo">
        <h3>Log In</h3>
      </div>

          <div class="login-inner">
            <img src="./resources/images/omino.png" alt="omino">
            <input type="email" id="username" name="email" id="email" aria-describedby="nameHelp"
            placeholder="Inserisci la tua email" required>
        </div>

        <div class="login-inner">
            <img src="./resources/images/lucchetto.png" alt="lucchetto">
            <input type="password" id="password" name="password" id="password" aria-describedby="nameHelp"
                placeholder="Inserisci la tua password" min="8" required>
            <input type="hidden" name="action" value="login">
        </div>

         <div class="login-buttons">
        <input type="submit" value="Login"/>
        <input type="reset" value="Reset"/>
      </div>
    </form>

    <form action="Login" method="get">
        <div class="form-group">
            <input type="hidden" name="action" value="register">
        </div>

        <div>
            <p>Sei un nuovo utente?</p>
            <button type="submit" class="btn btn-success mt-2">Registarti ora!</button>
        </div>
    </form>
    </div>
    <div class="errors">
        <ul>
        <c:forEach items="${errors}" var="err">
            <li>${err}</li>
        </c:forEach>
        </ul>
    </div>
</z:layout>