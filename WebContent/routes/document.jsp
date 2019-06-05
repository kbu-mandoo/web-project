<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <!-- for hot module reloading -->
    <script src="./index.js"></script>
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

        .document {
            min-width: 100vw;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            font-family: "Nanum Gothic", sans-serif;
            padding-bottom: 350px;
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

    .navigationContainer_left_logoOrName > a {
      margin-right: 50px;
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

    .navigationContainer_left_aTag__text > a:hover{
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

        .document__body {
            display: flex;
            width: 100%;
            height: 100%;
            margin-top: 100px;
        }

        .document__body__left {

            position: fixed;
            padding-left: 30px;

        }

        .document__body__right {
            width: 100%;
            margin-left: 350px;
            padding: 20px;

        }

        .document__body__left__navigation_box {
            width: 100%;


        }

        .document__body__left__navigation_box__item {
            margin-bottom: 20px;
            transition: 0.2s ease-in-out;
            cursor: pointer;
            font-size: 14px;
        }

        .document__body__left__navigation_box__item:hover {
            font-size: 16px;
        }

        .document__body__left__navigation_box__item:active {
            font-weight: 900;
        }

        .document__body__right__title_text {
            font-size: 40px;
            font-weight: 900;
            margin-bottom: 50px;
            cursor: pointer;
        }

        .document__body__right__normal_text {
            letter-spacing: 1.3px;
            line-height: 25px;
        }

        .division_line_container {
            width: 100%;
            display: flex;
            justify-content: center;
            margin-top: 150px;
            margin-bottom: 150px;
        }

        .division_line_container_item {
            width: 80%;
            border: 0;
            height: 1px;
            background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(255, 255, 255, 250.75), rgba(0, 0, 0, 0));
        }

	a {
		text-decoration: none;
	}

        /* to here, navigation bar css */
        
        #current_page {
        color:#74b9ff;
        }
    </style>
</head>
<script>
    function clickNavigation(scrolltop) {
        $('html, body').animate({
            scrollTop: scrolltop
        }, 800)
    }
</script>

<body>
    <div class="document">
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
                        <a href="/WebProject/index.jsp?route=colorizeImages">
                            colorize images
                        </a>
                    </div>
                    <div class="navigationContainer_left_aTag__text">
                        <a id="current_page" href="/WebProject/index.jsp?route=document">
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
        <div class="document__body">
            <div class="document__body__left">
                <div class="document__body__left__navigation_box">
                    <div onclick="clickNavigation(165)" class="document__body__left__navigation_box__item">
                        Introduce
                    </div>
                    <div onclick="clickNavigation(726)" class="document__body__left__navigation_box__item">
                        Perspective Transform
                    </div>
                </div>
            </div>
            <div class="document__body__right">
                <div class="document__body__right__title_text">
                    Introduce
                </div>
                <div class="document__body__right__normal_text">
                    Welcome to MANDOO! <br><br>
                    If you have any picture you really want to get in the other image?
                    If you have any black and white photo you want to convert to color photo?
                    <br><br><br>
                    We are providing these services in very simple way and free!
                    Enjoy our web site then experience it now!
                </div>
                <div class="division_line_container">
                    <div class="division_line_container_item"></div>
                </div>
                <div class="document__body__right__title_text">
                    Perspective Transform
                </div>
                <div class="document__body__right__normal_text">
                    First, click the "upload image button" then select some image you want to cut
                    <br><br>
                    Second, Point 4 points that you want to cut from the image. Note that you have to point in a
                    clockwise direction from the top left corner
                    <br><br>
                    Third, Click the 'NEXT' button and waiting for your transformed image for a while.
                    <br><br>
                    Fourth, Original image on the left size, transformed image on the right side. You can download the
                    image by clicking the 'DOWNLOAD' button. The file's name will be 'change_original_file_name'
                </div>
                <div class="division_line_container">
                    <div class="division_line_container_item"></div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>