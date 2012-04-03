
<%@ page import="org.dfw2gug.Work" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'work.label', default: 'Work')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-work" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-work" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list work">
			
				<g:if test="${workInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="work.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${workInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="work.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${workInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workInstance?.artist}">
				<li class="fieldcontain">
					<span id="artist-label" class="property-label"><g:message code="work.artist.label" default="Artist" /></span>
					
						<span class="property-value" aria-labelledby="artist-label"><g:link controller="artist" action="show" id="${workInstance?.artist?.id}">${workInstance?.artist?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${workInstance?.created}">
				<li class="fieldcontain">
					<span id="created-label" class="property-label"><g:message code="work.created.label" default="Created" /></span>
					
						<span class="property-value" aria-labelledby="created-label"><g:formatDate date="${workInstance?.created}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${workInstance?.id}" />
					<g:link class="edit" action="edit" id="${workInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
