<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"  %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.net.*"  %>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@ page import = "org.apache.commons.codec.binary.Base64" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<title>Insert title here</title>
<style>
        html,
        body,
        div,
        span,
        applet,
        object,
        iframe,
        h1,
        h2,
        h3,
        h4,
        h5,
        h6,
        p,
        blockquote,
        pre,
        a,
        abbr,
        acronym,
        address,
        big,
        cite,
        code,
        del,
        dfn,
        em,
        img,
        ins,
        kbd,
        q,
        s,
        samp,
        small,
        strike,
        strong,
        sub,
        sup,
        tt,
        var,
        b,
        u,
        i,
        center,
        dl,
        dt,
        dd,
        ol,
        ul,
        li,
        fieldset,
        form,
        label,
        legend,
        table,
        caption,
        tbody,
        tfoot,
        thead,
        tr,
        th,
        td,
        article,
        aside,
        canvas,
        details,
        embed,
        figure,
        figcaption,
        footer,
        header,
        hgroup,
        menu,
        nav,
        output,
        ruby,
        section,
        summary,
        time,
        mark,
        audio,
        video {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
            background-color: #2c3e50;
            color: white;
        }
        .perspectiveTransform2 {
            min-width: 100vw;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            font-family: "Nanum Gothic", sans-serif;
        }
        /* from here */
        .navigationContainer {
            display: flex;
            justify-content: space-between;
            padding: 15px;
            padding-left: 50px;
            padding-right: 30px;
            align-items: flex-end;
        }
        .navigationContainer_left_logoOrName {
            margin-right: 50px;
            font-weight: 900;
            font-size: 25px;
            cursor: pointer;
        }
        .navigationContainer_left_aTag__text {
            margin-right: 20px;
            cursor: pointer;
            font-size: 14px;
            width: 170px;
            height: 27px;
            display: flex;
            align-items: flex-end;
            transition: 0.2s ease-in-out;
        }
        .navigationContainer_left_aTag__text:hover {
            font-size: 16px;
        }
        .navigationContainer_left {
            display: flex;
            align-items: flex-end;
        }
        .navigationContainer_left_aTag {
            display: flex;
        }
        .navigationContainer_right {}
        .navigationContainer_right_logout {
            display: flex;
            align-items: flex-end;
            cursor: pointer;
        }
        /* to here, navigation bar css */
        .perspectiveTransform2__body {
            width: 100%;
            height: 100%;
            display: flex;
        }
        .perspectiveTransform2__body_left {
            width: 50%;
            display: flex;
            justify-content: center;
            margin-top: 100px;
            align-items: center;
        }
        .perspectiveTransform2__body_left>img {
            -webkit-box-shadow: 10px 10px 23px -13px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 10px 10px 23px -13px rgba(0, 0, 0, 0.75);
            box-shadow: 10px 10px 23px -13px rgba(0, 0, 0, 0.75);
            max-width: 500px;
        }
        .perspectiveTransform2__button {
            width: 100%;
            display: flex;
            justify-content: center;
            margin-top: 140px;
            margin-bottom: 110px;
        }
        .perspectiveTransform2__button>button {
            border: 0;
            border-radius: 10px;
            color: white;
            background: #3498db;
            width: 250px;
            height: 80px;
            font-size: 30px;
            cursor: pointer;
            -webkit-box-shadow: 10px 10px 23px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 10px 10px 23px 0px rgba(0, 0, 0, 0.75);
            box-shadow: 10px 10px 23px 0px rgba(0, 0, 0, 0.75);
        }
    </style>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%!


private static class IPC{
		private static final int BUFSIZE = 2048;
		
		public static String interact(String message, String dstIP, int dstPort) throws IOException {
			return IPC.interact(message, dstIP, dstPort);
		}
		
		public static String interact(String message, String dstIP, int dstPort, int timeout) throws IOException {
			try(Socket s = new Socket(dstIP, dstPort)){
				DataInputStream in = new DataInputStream(s.getInputStream());
				DataOutputStream out = new DataOutputStream(s.getOutputStream());
				
				// send json data to server
				out.writeInt(message.length());
				out.write(message.getBytes());
				out.flush();
				
				//receiv base64 image or err message
				System.out.println("hi!");
				s.setSoTimeout(timeout);
				System.out.println("hi!2");
				// 4 bytes prefix -> length of json data
				int imageLen = in.readInt();
				
				int totalLen = 0;
				if(imageLen == 0) {
					// no data
					return "";
				}
				
				ByteArrayOutputStream outStream = new ByteArrayOutputStream();
				byte[] chunk = new byte[BUFSIZE];
				do {
					int readLen = in.read(chunk);
					totalLen += readLen;
					if(readLen == BUFSIZE) {
						outStream.write(chunk);
					}else {
						outStream.write(Arrays.copyOfRange(chunk, 0, readLen));
					}
				}while (totalLen < imageLen);
				
				return outStream.toString(); 	// base64 image or err message
			}
		}
	}
%>
<%
	 boolean loading = true;
	String dstIP = "192.168.0.56";
	int dstPort = 9766;
/*  	int point1x = Integer.parseInt(request.getParameter("point1x"));
 	int point1y = Integer.parseInt(request.getParameter("point1y"));
 	int point2x = Integer.parseInt(request.getParameter("point2x"));
 	int point2y = Integer.parseInt(request.getParameter("point2y"));
 	int point3x = Integer.parseInt(request.getParameter("point3x"));
	int point3y = Integer.parseInt(request.getParameter("point3y"));
	int point4x = Integer.parseInt(request.getParameter("point4x"));
	int point4y = Integer.parseInt(request.getParameter("point4y")); */
	String base64 = "";
	String stringBase64 = "";
 	JSONObject json = new JSONObject();
 	json.put("req", "perspective");

	
/* 	System.out.println("point1x:"+point1x); */
	
	
	/* Get File from previous jsp page  */
	File file;
	int maxFileSize = 5000 * 1024;
	int maxMemSize = 5000 * 1024;
	ServletContext context = pageContext.getServletContext();
	
	// Verify the content type
	String contentType = request.getContentType();
	if((contentType.indexOf("multipart/form-data") >= 0)){
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//Maximun size that will be stored in memory
		factory.setSizeThreshold(maxMemSize);
		
		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		// maximun file size to be uploaded
		upload.setSizeMax(maxFileSize);
		try{
			// Parse the request to get file items.
			List<FileItem> fileItems = upload.parseRequest(request);
			
			// Process the uploaded file items
			Iterator i = fileItems.iterator();
			
			while (i.hasNext()) {
				FileItem fi = (FileItem)i.next();
				if(!fi.isFormField()) {
					// Get the uploaded file parameters
					String fieldName = fi.getFieldName();
					String fileName = fi.getName();
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();

/* 					base64 = fi.get();
					stringBase64 = Base64.encodeBase64String(base64); */
				}
			}
			
			for (FileItem uploadItem : fileItems) {
				if(uploadItem.isFormField()) {
					String fieldName = uploadItem.getFieldName();
					String value = uploadItem.getString();
					try{
						json.put(fieldName, Integer.parseInt(value));	
					}catch(Exception e) {
						json.put(fieldName, value);
						base64 = value;
					}
					
				}
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
	}
	
	
	
	
	/* Get File from previous jsp page  */
	


/*  	json.put("cdn_x1", point1x);
 	json.put("cdn_x2", point2x);
 	json.put("cdn_x3", point3x);
 	json.put("cdn_x4", point4x);
 	json.put("cdn_y1", point1y);
 	json.put("cdn_y2", point2y);
 	json.put("cdn_y3", point3y);
 	json.put("cdn_y4", point4y); */
 	
 	long jsonDataLength = new Long(json.toString().length());
 	System.out.println("json length: ");
 	System.out.println(jsonDataLength);
 	
 	
 	String resultImageBase64OrErrorMessage = "";
 	resultImageBase64OrErrorMessage = IPC.interact(json.toString(),dstIP, dstPort, 10000);
 	
 	
 	loading = false; 
 	
 	
 	
 	
 %>
 <div class="perspectiveTransform2">
        <div class="navigationContainer">
            <div class="navigationContainer_left">
                <div class="navigationContainer_left_logoOrName">
                    MAN DOO
                </div>
                <div class="navigationContainer_left_aTag">
                    <div class="navigationContainer_left_aTag__text">
                        perspective transform
                    </div>
                    <div class="navigationContainer_left_aTag__text">
                        colorize images
                    </div>
                    <div class="navigationContainer_left_aTag__text">
                        DOC
                    </div>
                </div>
            </div>
            <div class="navigationContainer_right">
                <div class="navigationContainer_right_logout">
                    logout
                </div>
            </div>
        </div>
        <%
        if(loading) {
        	%>
        	<div>loading...</div>
        	<%
        }

        else {
        	%>
        	<div class="perspectiveTransform2__body">
            <div class="perspectiveTransform2__body_left">
                <img  src="<%=base64%>"
                    alt="">
            </div>
            <div class="perspectiveTransform2__body_left">
                <img  src="<%=resultImageBase64OrErrorMessage%>"
                    alt="">
            </div>
        </div>
        	<%
        }
        %> 
        
        <div class="perspectiveTransform2__button">
            <button>DOWNLOAD</button>
        </div>
    </div>
 </body>
</html>