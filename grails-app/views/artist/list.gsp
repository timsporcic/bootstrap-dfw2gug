
<%@ page import="org.dfw2gug.Artist" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'artist.label', default: 'Artist')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-artist" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-artist" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'artist.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="birthDate" title="${message(code: 'artist.birthDate.label', default: 'Birth Date')}" />
					
						<g:sortableColumn property="home" title="${message(code: 'artist.home.label', default: 'Home')}" />
					
						<g:sortableColumn property="style" title="${message(code: 'artist.style.label', default: 'Style')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${artistInstanceList}" status="i" var="artistInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${artistInstance.id}">${fieldValue(bean: artistInstance, field: "name")}</g:link></td>
					
						<td><g:formatDate date="${artistInstance.birthDate}" /></td>
					
						<td>${fieldValue(bean: artistInstance, field: "home")}</td>
					
						<td>${fieldValue(bean: artistInstance, field: "style")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${artistInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
