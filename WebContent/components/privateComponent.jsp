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
	if(route == null){
		route = "";
	}
%>
<body>


<%// url parameter 의 route 변수의 값에 따라서 보여지는 파일이 달라짐. 
	if(route.equals("perspectiveTransform")){
		%>
		<jsp:include page="../routes/perspectiveTransform.jsp" flush="false" />
		<%
	}else if(route.equals("colorizeImages")){
		%>
		<jsp:include page="../routes/colorizeImages.jsp" flush="false" />
		<%
	}else if (route.equals("perspectiveTransform2")){
		%>
		<jsp:include page="../routes/perspectiveTransform2.jsp" flush="false" />
		<%
	}else if(route.equals("document")){
		%>
		<jsp:include page="../routes/document.jsp" flush="false" />
		<%
	} else {
		%>
		<jsp:include page="/routes/main.jsp" flush="false" />
		<%
	}
%>
</body>
</html>