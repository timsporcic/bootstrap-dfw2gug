<%@ page import="org.dfw2gug.Artist" %>

<div class="control-group ${hasErrors(bean: artistInstance, field: 'name', 'error')} ">
    <label class="control-label" for="name">
        <g:message code="artist.name.label" default="Name" />
    </label>
    <div class="controls">
        <g:textField name="name" value="${artistInstance.name}"/>
    </div>
</div>

<div class="control-group ${hasErrors(bean: artistInstance, field: 'style', 'error')} ">
    <label class="control-label" for="style">
        <g:message code="artist.style.label" default="Style" />
    </label>
    <div class="controls">
        <g:select name="style"
                  from="${artistInstance.constraints.style.inList}"
                  value="${artistInstance?.style}"
                  valueMessagePrefix="artist.style"
                  noSelection="['': '']"/>
    </div>
</div>

<div class="control-group ${hasErrors(bean: artistInstance, field: 'birthDate', 'error')} ">
    <label class="control-label" for="birthDate">
        <g:message code="artist.birthDate.label" default="Birth Date" />
    </label>
    <div class="controls">
        <g:textField name="birthDate" value="${formatDate(format: "MM/dd/yyyy", date: artistInstance.birthDate)}"/>
    </div>
</div>

