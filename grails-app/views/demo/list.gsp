<%@ page import="org.dfw2gug.Artist" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <title><g:message code="demo.title" default="BootStrap Demo" /></title>
</head>
<body class="artistList">

<div class="container">
    <div class="page-header">
        <h2>Artist List</h2>
    </div>
    <div class="row">
        <div class="span10 offset1">
            <g:if test="${flash.message}">
                <div class="alert alert-error fade in">
                    <a class="close" data-dismiss="alert" href="#">&times;</a>
                    ${flash.message}
                </div>
            </g:if>
        </div>
    </div>

    <div class="row">

        <div class="span12">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <g:sortableColumn property="name" title="Name" />
                    <g:sortableColumn property="birthDate" title="Birth Date" />
                    <g:sortableColumn property="style" title="Style" />
                    <th>Works</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${artistInstanceList}" status="i" var="artistInstance">
                <tr>
                    <td>
                        <g:link action="show" id="${artistInstance.id}">
                            <g:fieldValue field="name" bean="${artistInstance}"/>
                        </g:link>
                    </td>
                    <td><g:formatDate format="MM/dd/yyyy" date="${artistInstance.birthDate}"/></td>
                    <td><g:fieldValue field="style" bean="${artistInstance}"/></td>
                    <td>
                        ${artistInstance.works.size()}
                    </td>
                </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        $('.navbar-fixed-top ul.nav li').removeClass('active');
        $('#listPage').addClass('active');
    });
</script>

</body>
</html>


