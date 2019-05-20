<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"  %>
<%@ page import="java.net.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
 	String point1x = request.getParameter("point1x");
 	String point1y = request.getParameter("point1y");
 	String point2x = request.getParameter("point2x");
 	String point2y = request.getParameter("point2y");
 	String point3x = request.getParameter("point3x");
	String point3y = request.getParameter("point3y");
	String point4x = request.getParameter("point4x");
	String point4y = request.getParameter("point4y");
 	String base64 = request.getParameter("base64");
 	

 		
 		  try{
 		   Socket s = new Socket("localhost",3000);
 		   
 		   OutputStream os = s.getOutputStream();
 		   InputStream is = s.getInputStream();
 		   BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(os));
 		   BufferedReader br = new BufferedReader(new InputStreamReader(is));
 		   
 		   bw.write(" => 클라이언트 입니다. \n");
 		   bw.flush();
 		   
 		   String message = br.readLine();
 		   System.out.println("[서버 메세지] " + message);
 		  }catch(UnknownHostException e){
 		   System.out.println("[경고] 서버를 찾을 수 없습니다.");
 		  }catch(IOException e){
 		   System.out.println("[경고] 사용되지 않는 PORT 번호 입니다.");
 		  }
 %>
 </body>
</html>