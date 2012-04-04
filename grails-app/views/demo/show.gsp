<%@ page import="org.dfw2gug.Artist" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <title><g:message code="demo.title" default="BootStrap Demo" /></title>
</head>
<body class="artistShow">

<div class="container">
    <div class="page-header">
        <h2>Featured Artist
        <g:link class="btn pull-right" action="edit" id="${artistInstance.id}">
        <i class="icon-edit"></i> Edit
        </g:link>
        </h2>
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
        <div class="well">
        <div class="span3">
            <h3><small>Name: </small><g:fieldValue field="name" bean="${artistInstance}"/></h3>
        </div>
        <div class="span3">
            <h3><small>Birth Date: </small><g:formatDate format="MM/dd/yyyy" date="${artistInstance.birthDate}"/></h3>
        </div>
        <div class="span3">
            <h3><small>Style: </small><g:fieldValue field="style" bean="${artistInstance}"/></h3>
        </div>
        </div>
    </div>

    <div class="row">
        <div class="span8 offset1">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>Title</th>
                    <th>Created</th>
                    <th>Price</th>
                    <th>&nbsp;</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${artistInstance.works}" status="i" var="work">
                    <tr>
                        <td><g:fieldValue field="title" bean="${work}"/></td>
                        <td><g:formatDate format="MM/dd/yyyy" date="${work.created}"/></td>
                        <td class="right">
                            <g:formatNumber number="${work.price}" format="\$ ###,##0" />
                        </td>
                        <td width="100">
                            <g:link action="buy" id="${work.id}" class="btn btn-success btn-small">
                                <i class="icon-shopping-cart icon-white"></i> Buy Now
                            </g:link>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('.navbar-fixed-top ul.nav li').removeClass('active');
        $('#showPage').addClass('active');
    });
</script>
</body>
</html>