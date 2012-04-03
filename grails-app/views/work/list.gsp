
<%@ page import="org.dfw2gug.Work" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'work.label', default: 'Work')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-work" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-work" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'work.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'work.price.label', default: 'Price')}" />
					
						<th><g:message code="work.artist.label" default="Artist" /></th>
					
						<g:sortableColumn property="created" title="${message(code: 'work.created.label', default: 'Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${workInstanceList}" status="i" var="workInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${workInstance.id}">${fieldValue(bean: workInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: workInstance, field: "price")}</td>
					
						<td>${fieldValue(bean: workInstance, field: "artist")}</td>
					
						<td><g:formatDate date="${workInstance.created}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${workInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
