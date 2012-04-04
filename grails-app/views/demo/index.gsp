<%@ page import="org.dfw2gug.Artist" %>
<%@ page import="org.dfw2gug.Work" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <title><g:message code="demo.title" default="BootStrap Demo" /></title>
</head>
<body class="index-page">
    <div class="container">
        <div class="hero-unit">
            <h1>Art Gallery</h1>
            <h3>Artists: ${Artist.count()}</h3>
            <h3>Works: ${Work.count()}</h3>
            <p><g:link action="list" class="btn btn-primary btn-large">Order Now!</g:link></p>
        </div>
    </div>
</body>
</html>




