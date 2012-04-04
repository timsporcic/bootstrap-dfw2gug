<%@ page import="org.dfw2gug.Artist" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <title><g:message code="demo.title" default="BootStrap Demo" /></title>
</head>
<body class="artistEdit">

<div class="container">
    <div class="page-header">
        <h2>Edit Artist</h2>
    </div>
    <div class="row">
        <div class="span8 offset1">
            <g:if test="${flash.message}">
                <div class="alert alert-error fade in">
                    <a class="close" data-dismiss="alert" href="#">&times;</a>
                    ${flash.message}
                </div>
            </g:if>
        </div>
    </div>

    <g:hasErrors bean="${artistInstance}">
        <div class="span8 offset1 alert alert-error fade in">
            <ul class="errors">
                <g:eachError bean="${artistInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>

    <div class="row">
        <div class="span6 offset1 form">
            <g:form method="post" class="form-horizontal content-form" action="update" controller="demo" >
                <g:hiddenField name="id" value="${artistInstance.id}"/>
                <g:hiddenField name="version" value="${artistInstance.version}"/>
                <g:render template="form"/>
                <div class="form-actions right">


                    <a href="#" class="btn btn-primary" id="submitLink"><i class="icon-check icon-white"></i> Update</a>

                    <g:link action="show" id="${artistInstance.id}" class="btn">
                        <i class="icon-remove"></i> Cancel
                    </g:link>
                </div>
            </g:form>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('.navbar-fixed-top ul.nav li').removeClass('active');
        $('#formPage').addClass('active');

        $('#submitLink').click(function(e){
            e.preventDefault();
            $('form').submit();
        });
    });
</script>


</body>
</html>