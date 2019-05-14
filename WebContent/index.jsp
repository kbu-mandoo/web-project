<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
This is index page
<%
String id = (String)session.getAttribute("id");
// 로그인이 되었을때 session을 받음
boolean loggedIn = false;
if(id == null){	// session값이 존재하지 않으면
	loggedIn = false;	// 로그인이 되어져있지 않고
}else {			// session값이 존재하면
	loggedIn = true;	// 로그인이 되어져있다.
}

if(loggedIn){		// 로그인이 되어져있으면
	%>
	<jsp:forward page="./components/privateComponent.jsp" />	<!-- privateComponent 로 가고 -->
	<% 
}else {				// 로그인이 안되어져있으면
	%>
	<jsp:forward page="./components/publicComponent.jsp" />		<!-- publicComponent 로 감.  -->
	<%
}

%>
</body>
</html>