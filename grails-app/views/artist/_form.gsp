<%@ page import="org.dfw2gug.Artist" %>



<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="artist.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${artistInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'birthDate', 'error')} ">
	<label for="birthDate">
		<g:message code="artist.birthDate.label" default="Birth Date" />
		
	</label>
	<g:datePicker name="birthDate" precision="day"  value="${artistInstance?.birthDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'home', 'error')} required">
	<label for="home">
		<g:message code="artist.home.label" default="Home" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="home" required="" value="${artistInstance?.home}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'style', 'error')} ">
	<label for="style">
		<g:message code="artist.style.label" default="Style" />
		
	</label>
	<g:select name="style" from="${artistInstance.constraints.style.inList}" value="${artistInstance?.style}" valueMessagePrefix="artist.style" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'works', 'error')} ">
	<label for="works">
		<g:message code="artist.works.label" default="Works" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${artistInstance?.works?}" var="w">
    <li><g:link controller="work" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="work" action="create" params="['artist.id': artistInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'work.label', default: 'Work')])}</g:link>
</li>
</ul>

</div>

