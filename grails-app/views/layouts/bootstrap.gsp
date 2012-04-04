<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><g:layoutTitle default="DFW Groovy Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <r:require module="bootstrap" />
    <g:layoutHead/>
    <r:layoutResources />
</head>
<body class="${pageProperty(name: 'body.class')}">

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <g:link action="index" class="brand">Groovy!</g:link>
            <div class="nav-collapse">
                <ul class="nav">
                    <li id="homePage" class="active"><g:link controller="demo" action="index">Home</g:link></li>
                    <li id="listPage"><g:link controller="demo" action="list">List</g:link></li>
                    <li id="showPage"><g:link controller="demo" action="show">Show</g:link></li>
                    <li id="formPage"><g:link controller="demo" action="form">Form</g:link></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<g:layoutBody/>
<r:layoutResources />
</body>
</html>




