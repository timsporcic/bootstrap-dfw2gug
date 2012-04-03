
<%@ page import="org.dfw2gug.Artist" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'artist.label', default: 'Artist')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-artist" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-artist" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list artist">
			
				<g:if test="${artistInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="artist.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${artistInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${artistInstance?.birthDate}">
				<li class="fieldcontain">
					<span id="birthDate-label" class="property-label"><g:message code="artist.birthDate.label" default="Birth Date" /></span>
					
						<span class="property-value" aria-labelledby="birthDate-label"><g:formatDate date="${artistInstance?.birthDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${artistInstance?.home}">
				<li class="fieldcontain">
					<span id="home-label" class="property-label"><g:message code="artist.home.label" default="Home" /></span>
					
						<span class="property-value" aria-labelledby="home-label"><g:fieldValue bean="${artistInstance}" field="home"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${artistInstance?.style}">
				<li class="fieldcontain">
					<span id="style-label" class="property-label"><g:message code="artist.style.label" default="Style" /></span>
					
						<span class="property-value" aria-labelledby="style-label"><g:fieldValue bean="${artistInstance}" field="style"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${artistInstance?.works}">
				<li class="fieldcontain">
					<span id="works-label" class="property-label"><g:message code="artist.works.label" default="Works" /></span>
					
						<g:each in="${artistInstance.works}" var="w">
						<span class="property-value" aria-labelledby="works-label"><g:link controller="work" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${artistInstance?.id}" />
					<g:link class="edit" action="edit" id="${artistInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
