<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- For including any file in current file This print the all detail in index.html file-->

<!-- Declartion tag -->
<%! 
	int a=10;
	int b=20;
	
	String name="Swapnil";
	public int sumOfNo(){
		return a+b;
	}
	
	public String printString(){
		return name+" "+"Tawhare";
	}
%>

<!-- Scriptlet Tag -->

<%
	out.println("The value of a is = "+a);
	out.println("<br>The value of b is = "+b);
	out.println("<br>The value of sum function is = "+sumOfNo());
	
%>

<c:set var="name" value="Swapnil"></c:set>

<c:out value="${name}"></c:out>

<c:out value="${a}"></c:out>

<!-- Expression tag -->

	<h1> The value of Print String function is <%= printString()%> </h1>
</body>
</html>