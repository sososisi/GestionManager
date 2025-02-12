<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/employesCss.css">


<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">


<!-- Bootstrap CSS  -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<!-- Font awesome -->
<link href="\C:\Users\afpa\Documents\fontawesome/css/all.css"
	rel="stylesheet">
<!--load all styles -->

<!-- MDBootstrap Datatables CSS  -->
<link href="css/addons/datatables.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.slim.min.js"
	integrity="sha512-6ORWJX/LrnSjBzwefdNUyLCMTIsGoNP6NftMy2UAm1JBm6PRZCO1d7OHBStWpVFZLO+RerTvqX/Z9mBFfCJZ4A=="
	crossorigin="anonymous"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<!-- JQUERY -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>

<!-- MDBootstrap Datatables JS  -->
<script type="text/javascript" src="js/addons/datatables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/v/dt/dt-1.10.24/datatables.min.js"></script>
<script
	src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.colVis.min.js"></script>

</head>
<body>
	<div class="head">
	<nav class="navbar navbar-expand-sm bg-light navbar-dark">
    
        <div class="navbar-brand" >
            <a href="#"> <img src="img/manager.png" alt="saj logo" class="logo align-self-center" height=105
                    width=110> </a>
        </div>
        
        <div>
        <ul class="navbar-nav nav">
        <form:form class="form" action="accueilConnecte" method="get">
            <li class="nav-item item">
                <a><button class="nav-link btn"><spring:message code="nav.accueil"></spring:message></button></a>
            </li>
            </form:form>
            <form:form class="form" action="manager" method="get">
            <li class="nav-item item">
            <a><button class="nav-link btn">Managers</button></a>
            </li>
              </form:form>
           
            <li class="nav-item dropdown " >
              <a class="nav-link dropdown down" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><spring:message code="nav.employes"></spring:message> </a>
             
              <div class="dropdown-menu " id="deroulant" aria-labelledby="navbarDropdownMenuLink">
               <form:form class="form" action="employe" method="post">
               <a><button class="nav-link btn"><spring:message code="nav.listemp"></spring:message></button></a>
               </form:form>
                <form:form class="form" action="ajoutEmploye" method="get">
                 <a><button class="nav-link btn"><spring:message code="nav.addemp"></spring:message></button></a>
                </form:form>  
              </div>
          </li>
          <form:form class="form" action="parametres" method="get">
            <li class="nav-item item">
             <a><button class="nav-link btn"><spring:message code="nav.param"></spring:message></button></a>
              
            </li>
            </form:form>
            <form:form class="form" action="contact" method="get">
            <li class="nav-item item">
               <a><button class="nav-link btn">Contact</button></a>
            </li>
            </form:form>
             <form:form class="form" action="qsm" method="get">
            <li class="nav-item item">
                <a><button class="nav-link btn"><spring:message code="login.QSM"></spring:message></button></a>
            </li>
            </form:form>
             <form:form class="form" action = "logout" method="get">
            <li class="nav-item item" id="deco">
            <a><button onclick="return onButtonDeco();" class="nav-link btn"><spring:message code="nav.deco"></spring:message></button></a>
      
            </li>
            </form:form>
            
        </ul>
        </div>
        
        
        
        
    </nav>
	
	<div class="langues">
        
        <a href="${pageContext.request.contextPath}/employeRedirect?lang=en"><img src="img/angleterre.png" alt="English" height=30 width=30 /></a>
	   <a href="${pageContext.request.contextPath}/employeRedirect?lang=fr"><img src="img/france.png" alt="Français" height=30 width=30 /></a>
    </div>
    
    </div>
    
	<div class="tit"><spring:message code="employes.titre"></spring:message></div>
	

	<div class="table-responsive ticketList">
		<table id="dtBasicExample" class="table table-striped w-auto">
			<thead>
				<tr>
					
					<th class="th-sm"><spring:message code="tab.fullname"></spring:message></th>
					<th class="th-sm"><spring:message code="tab.date"></spring:message></th>
					<th class="th-sm"><spring:message code="tab.titre"></spring:message></th>
					<th class="th-sm">Manager</th>
					<th class="th-sm">Action</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${employees}" var="employee">
					<tr>
					
						<td>${employee.firstName} ${employee.lastName }</td>
						<td>${employee.startDate }</td>
						<td>${employee.title }</td>
						<td>${employee.manager.firstName} ${employee.manager.lastName}</td>
					    <td id="btns">
					    <form:form class="form" action = "update" method="get">
					    <button  class="btn btn-light" value="Modifier"><img src="img/edit.png" alt="logo"></button>
<%-- 					    <button class="btn btn-outline-primary btn-sm m-0 waves-effect"><spring:message code="tab.update"></spring:message></button> --%>	
				        <input type="hidden" name="idToUp" value="${employee.empId }">
					    </form:form>
					    <form:form class="form" action = "delete" method="post">
					    <button onclick="return onButtonDelete();" class="btn btn-danger" ><img src="img/bin2.png" alt="logo"></button>
					    <input type="hidden" name="idToDel" value="${employee.empId }">
					    </form:form>
					    </td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					
					<th><spring:message code="tab.fullname"></spring:message></th>
					<th><spring:message code="tab.date"></spring:message></th>
					<th><spring:message code="tab.titre"></spring:message></th>
					<th>Manager</th>
					<th>Action</th>
				</tr>
			</tfoot>
		</table>
	</div>
<script src="js/jsImports.js"></script>
<%@ include file="/WEB-INF/resources/Include/footer.jsp"%>
</body>

</html>