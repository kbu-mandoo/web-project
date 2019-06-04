<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet" />
    <!-- for fontawesome -->
    <script src="https://kit.fontawesome.com/06b5185406.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <!-- for hot module reloading -->
    <script src="./index.js"></script>
    <title>Main page</title>
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

        .main {
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

        .main_body__content__column {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .main_body__content__column:first-child {
            animation: fadein 4s;
        }

        .main_body__content__column:nth-child(2) {
            width: 150px;
        }

        .main_body__content__column:nth-child(3) {
            width: 500px;
        }


        #invisibleArrow {
            opacity: 0;
        }


        #visiableArrow {
            opacity: 1;
            animation: fadeinfromleft 2.5s;
        }


        .main_body__content__column>img {
            max-width: 500px;
        }

        .main_body__content__column>i {
            color: white;
            font-size: 40px;
        }

        .main_body {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 50px;
        }

        .main_body__big_title_text {
            font-size: 50px;
            font-weight: 900;
        }

        .main_body__content {
            display: flex;
        }

        @keyframes fadein {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
                visibility: visible;
            }
        }

        @keyframes fadeinfromleft {
            from {
                opacity: 0;
                margin-left: -55px;
            }

            to {
                opacity: 1;
                visibility: visible;
                margin-left: 0px;
            }
        }

        /* Firefox < 16 */
        @-moz-keyframes fadein {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        /* Safari, Chrome and Opera > 12.1 */
        @-webkit-keyframes fadein {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        /* Internet Explorer */
        @-ms-keyframes fadein {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        /* Opera < 12.1 */
        @-o-keyframes fadein {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        #invisibleimg2 {
            opacity: 0;
        }

        #visibleimg2 {
            opacity: 1;
            animation: fadeinfromleft 2.5s;
        }
    </style>
</head>

<body>
    <script>
        $(document).ready(function () {

            setTimeout(() => {
                $("#invisibleArrow").attr('id', 'visiableArrow');
            }, 1000);
            setTimeout(() => {
                $("#invisibleimg2").attr('id', 'visibleimg2')
            }, 2300);
        })
    </script>
    <div class="main">
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
        <div class="main_body">
            <div class="main_body__big_title_text">
                WELCOME TO MAN DOO!
            </div>
            <br><br><br>
            <div class="main_body__middle_title_text">
                Sign In, Enjoy Awesome Image Transforter For Free!
            </div>
            <div class="main_body__content">
                <div class="main_body__content__column">
                    <img id="img1"
                        src="https://cdn.shopify.com/s/files/1/0259/1735/products/macbook_air_template_2048x.png?v=1553516404"
                        alt="mac">
                </div>
                <div class="main_body__content__column"><i id="invisibleArrow" class="fas fa-arrow-right"></i></div>
                <div class="main_body__content__column">
                    <img id="invisibleimg2"
                        src="https://cdn.shopify.com/s/files/1/0259/1735/products/macbook_air_template_2048x.png?v=1553516404"
                        alt="mac">
                </div>
            </div>
            <div class="main_body__bottom">

            </div>
        </div>
    </div>
</body>

</html>