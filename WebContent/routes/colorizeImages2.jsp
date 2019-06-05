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
<% request.setCharacterEncoding("UTF-8"); %>
<!-- Declare class for server communication  -->
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
			s.setSoTimeout(timeout);
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
	String dstIP = "172.20.10.2";
int dstPort = 9766;
String Extension = "";
String FileName = "";
String base64 = "";
String stringBase64 = "";
JSONObject json = new JSONObject();

/* Get File from previous page  */
File file;
int maxFileSize = 5000 * 1024;
int maxMemSize = 5000 * 1024;
ServletContext context = pageContext.getServletContext();

// Verify the content type
String contentType = request.getContentType();
if((contentType.indexOf("multipart/form-data") >= 0)) {
	DiskFileItemFactory factory = new DiskFileItemFactory();
	//Maximun size that will be stored in memory
	factory.setSizeThreshold(maxMemSize);
	//create a new file upload handler
	ServletFileUpload upload = new ServletFileUpload(factory);
	//maximum file size to be uploaded
	upload.setSizeMax(maxFileSize);
	try{
		// Parse the request to get file items.
		List<FileItem> fileItems = upload.parseRequest(request);
		
		// Process the uploaded file items
		Iterator i = fileItems.iterator();
		
		while(i.hasNext()) {
			FileItem fi = (FileItem)i.next();
			if(!fi.isFormField()) {
				// Get the uploaded file parameters
				String fieldName = fi.getFieldName();
				String fileName = fi.getName();
				System.out.println("fileName: " + fileName);
				// First, find index of '.'
				int indexOfDot = fileName.indexOf(".");
				// Get string before '.'
				Extension = fileName.substring(indexOfDot + 1);
				boolean isInMemory = fi.isInMemory();
				long sizeInBytes = fi.getSize();
			}
		}
		
		for (FileItem uploadItem : fileItems) {
			if(uploadItem.isFormField()) {
				String fieldName = uploadItem.getFieldName();
				String value = uploadItem.getString();
				try{
					json.put(fieldName, Integer.parseInt(value));
				}catch (Exception e) {
					json.put(fieldName, value);
					base64 = value;
				}
			}
		}
	}catch(Exception ex) {
		System.out.println(ex);
	}
}
	System.out.println(json);

	String resultImageBase64OrErrorMessage = "";
	// resultImageBase64OrErrorMessage = IPC.interact(json.toString(),dstIP, dstPort, 10000);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="./index.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <title>Document</title>
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
            font-size: 14px;

        }

        .colorize2 {
            min-width: 100vw;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            font-family: "Nanum Gothic", sans-serif;
            scroll-behavior: smooth;
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
    
    .navigationContainer_left_logoOrName > a {
    font-weight: 900;
      font-size: 25px;
      cursor: pointer;
    }

    .navigationContainer_left_aTag__text > a {
      margin-right: 20px;
      cursor: pointer;
      font-size: 14px;
      width: 170px;
      height: 27px;
      display: flex;
      align-items: flex-end;
      transition: 0.2s ease-in-out;
    }

    .navigationContainer_left_aTag__text > a:hover {
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
    
        a {
      color: white;
      text-decoration: none;
    }

    /* to here, navigation bar css */


        .colorize2__image_container {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 90px;
        }

        .colorize2__image_container>img {
            max-width: 1200px;
            -webkit-box-shadow: 10px 10px 23px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 10px 10px 23px 0px rgba(0, 0, 0, 0.75);
            box-shadow: 10px 10px 23px 0px rgba(0, 0, 0, 0.75);
        }

        .colorize2_button_container {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 80px;
            margin-bottom: 200px;

        }

        .colorize2_button_container>button {
            width: 220px;
            height: 70px;
            background-color: white;
            color: #3498db;
            border-radius: 15px;
            border: 0;
            font-size: 30px;
            -webkit-box-shadow: 10px 10px 23px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 10px 10px 23px 0px rgba(0, 0, 0, 0.75);
            box-shadow: 10px 10px 23px 0px rgba(0, 0, 0, 0.75);
            cursor: pointer;
        }

        /* Style for loading component */

        .loading__container {
            background-color: #2c3e50;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: "montserrat", sans-serif;
        }

        .loading {
            width: 200px;
            height: 200px;
            box-sizing: border-box;
            border-radius: 50%;
            border-top: 10px solid #e74c3c;
            position: relative;
            animation: a1 2s linear infinite;
        }

        .loading::before,
        .loading::after {
            content: '';
            width: 200px;
            height: 200px;
            position: absolute;
            left: 0;
            top: -10px;
            box-sizing: border-box;
            border-radius: 50%;
        }

        .loading::before {
            border-top: 10px solid #e67e22;
            transform: rotate(120deg);
        }

        .loading::after {
            border-top: 10px solid #3498db;
            transform: rotate(240deg);
        }

        .loading span {
            position: absolute;
            width:200px;
            height:200px;
            color: #fff;
            text-align: center;
            line-height: 200px;
            animation: a2 2s linear infinite;
        }

        @keyframes a1 {
            to {
                transform: rotate(360deg);
            }
        }

        @keyframes a2 {
            to {
                transform: rotate(-360deg);
            }
        }

        /* Style for loading component */

        .invisible {
            display: none;
        }
        
            #current_page {
    color:#74b9ff;
    }
    </style>
</head>

<body>
    <script>
        $(document).ready(function () {
            setTimeout(() => {
                $("#loading__container").attr('class', 'invisible');
                $(".colorize2__image_container").attr('class', 'colorize2__image_container');
                $(".colorize2_button_container").attr('class', 'colorize2_button_container');
            }, 2800);
        })
    </script>
    <div class="colorize2">
         <div class="navigationContainer">
      <div class="navigationContainer_left">
        <div class="navigationContainer_left_logoOrName">
          <a href="/WebProject/index.jsp">MAN DOO</a>
        </div>
        <div class="navigationContainer_left_aTag">
          <div class="navigationContainer_left_aTag__text">
            <a href="/WebProject/index.jsp?route=perspectiveTransform">
              perspective transform
            </a>
          </div>
          <div class="navigationContainer_left_aTag__text">
            <a id="current_page" href="/WebProject/index.jsp?route=colorizeImages">
              colorize images
            </a>
          </div>
          <div class="navigationContainer_left_aTag__text">
            <a href="/WebProject/index.jsp?route=document">
              DOC
            </a>
          </div>
        </div>
      </div>
      <div class="navigationContainer_right">
        <div class="navigationContainer_right_logout">
          LOGOUT
        </div>
      </div>
    </div>
        <div id="loading__container" class="loading__container">
            <div class="loading">
                <span>Loading...</span>
            </div>
        </div>
        <div class="colorize2__image_container invisible">
            <img src="http://www.ricoh-imaging.co.jp/english/products/q-s1/ex/img/bod_mainImg_01.jpg" alt="">
        </div>
        <div class="colorize2_button_container invisible">
            <button>DOWNLOAD</button>
        </div>
    </div>
</body>

</html>