<%@ page import="org.dfw2gug.Work" %>



<div class="fieldcontain ${hasErrors(bean: workInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="work.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${workInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="work.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="price" min="0" required="" value="${fieldValue(bean: workInstance, field: 'price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workInstance, field: 'artist', 'error')} required">
	<label for="artist">
		<g:message code="work.artist.label" default="Artist" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="artist" name="artist.id" from="${org.dfw2gug.Artist.list()}" optionKey="id" required="" value="${workInstance?.artist?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workInstance, field: 'created', 'error')} required">
	<label for="created">
		<g:message code="work.created.label" default="Created" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="created" precision="day"  value="${workInstance?.created}"  />
</div>

