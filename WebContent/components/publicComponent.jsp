<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	String route = request.getParameter("route");
	if(route == null) {
		route = "";
	}
%>
<body>

<%
	
// url parameter �� route ������ ���� ���� �������� ������ �޶���. 
if(route.equals("signIn")) {
	%>
	<jsp:include page="../routes/signIn.jsp" flush="false" />
	<%
}
else if(route.equals("signUp")){
	%>
	<jsp:include page="../routes/signUp.jsp" flush="false" />
	<%
}
else {
	%>
	<jsp:include page="../routes/signIn.jsp" flush="false" />
	<%
}
	%>
</body>
</html>