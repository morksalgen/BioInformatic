<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>HelloWorld page</title>

        <c:url var="home" value="/" scope="request" />

        <spring:url value="/resources/jquery/jquery-3.2.1.min.js" var="jquery"></spring:url>
        <spring:url value="/resources/bootstrap/css/bootstrap.min.css" var="bootstrapCss"></spring:url>
        <spring:url value="/resources/bootstrap/js/bootstrap.min.js" var="bootstrapJs"></spring:url>
        <spring:url value="/resources/mine/css/vertical_nav.css" var="verticalNavCss"></spring:url>
        <spring:url value="/resources/mine/js/vertical_nav.js" var="verticalNavJs"></spring:url>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" type="text/css" href="${bootstrapCss}">
        <script type="text/javascript" src="${jquery}"></script>
        <script type="text/javascript" src="${bootstraJs}"></script>        

        <link rel="stylesheet" type="text/css" href="${verticalNavCss}">
        <script type="text/javascript" src="${verticalNavJs}"></script>  
    </head>
    <body>
        <p> Hi this is working really really fine...</p>
        Greeting : ${greeting}




        <script>
            function ajaxGenerate() {
                var data = {}
                data["a"] = "25";
                data["c"] = "25";
                data["t"] = "25";
                data["g"] = "25";
                data["length"] = "27";


                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "${home}api/generate",
                    data: JSON.stringify(data),
                    dataType: 'json',
                    timeout: 100000,
                    success: function (data) {
                        console.log("SUCCESS: ", data);
                        //display(data);
                    },
                    error: function (e) {
                        console.log("ERROR: ", e);
                        //display(e);
                    },
                    done: function (e) {
                        console.log("DONE");
                    }
                });
            }
            ajaxGenerate();
        </script>
    </body>
</html>