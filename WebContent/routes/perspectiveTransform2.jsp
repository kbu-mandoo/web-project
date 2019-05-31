<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"  %>
<%@ page import="java.net.*"  %>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>

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
        }
        .perspectiveTransform2__body_left>img {
            -webkit-box-shadow: 10px 10px 23px -13px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 10px 10px 23px -13px rgba(0, 0, 0, 0.75);
            box-shadow: 10px 10px 23px -13px rgba(0, 0, 0, 0.75);
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
<%
 	int point1x = Integer.parseInt(request.getParameter("point1x").trim());
 	int point1y = Integer.parseInt(request.getParameter("point1y").trim());
 	int point2x = Integer.parseInt(request.getParameter("point2x").trim());
 	int point2y = Integer.parseInt(request.getParameter("point2y").trim());
 	int point3x = Integer.parseInt(request.getParameter("point3x").trim());
	int point3y = Integer.parseInt(request.getParameter("point3y").trim());
	int point4x = Integer.parseInt(request.getParameter("point4x").trim());
	int point4y = Integer.parseInt(request.getParameter("point4y").trim());
 	String base64 = request.getParameter("base64");
 	byte[] base64Image = base64.getBytes();
 	JSONObject json = new JSONObject();
 	json.put("req", "perspective");
 	json.put("img", base64);
 	json.put("cdn_x1", point1x);
 	json.put("cdn_x2", point2x);
 	json.put("cdn_x3", point3x);
 	json.put("cdn_x4", point4x);
 	json.put("cdn_y1", point1y);
 	json.put("cdn_y2", point2y);
 	json.put("cdn_y3", point3y);
 	json.put("cdn_y4", point4y);
 	
 	long jsonDataLength = new Long(json.toString().length());
 	System.out.println("json length: ");
 	System.out.println(jsonDataLength);
 	
 	
 	try{
 		Socket socket = new Socket("210.123.255.179", 9766);
 		
 		DataInputStream input = new DataInputStream(socket.getInputStream());
 		DataOutputStream output = new DataOutputStream(socket.getOutputStream());
 		
        	output.writeLong(jsonDataLength);
			output.writeUTF(json.toString());
			output.flush();
            System.out.println("client: waiting...");
            String responseFromServer = input.readUTF();
            System.out.printf("client: got response: %s\n", response);
        
        socket.close();
 		
 		
 	}catch(IOException e){
 		e.printStackTrace();
 	}
 	
 	
 	
 	
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
        <div class="perspectiveTransform2__body">
            <div class="perspectiveTransform2__body_left">
                <img width="400" src="https://4.img-dpreview.com/files/p/E~TS590x0~articles/3925134721/0266554465.jpeg"
                    alt="">
            </div>
            <div class="perspectiveTransform2__body_left">
                <img width="400" src="https://4.img-dpreview.com/files/p/E~TS590x0~articles/3925134721/0266554465.jpeg"
                    alt="">
            </div>
        </div>
        <div class="perspectiveTransform2__button">
            <button>DOWNLOAD</button>
        </div>
    </div>
 </body>
</html>