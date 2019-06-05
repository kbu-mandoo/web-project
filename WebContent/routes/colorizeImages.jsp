<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>colorize page</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="./index.js"></script>
</head>
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

    /* from here */

    .navigationContainer {
        display: flex;
        justify-content: space-between;
        padding: 15px;
        padding-left: 50px;
        padding-right: 30px;
        align-items: center;
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

    .navigationContainer_right_logout>i {
        color: white;
        font-size: 30px;
    }





    /* to here, navigation bar css */

    .colorize {
        min-width: 100vw;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        font-family: "Nanum Gothic", sans-serif;
        scroll-behavior: smooth;
    }

    .colorize__image_uploader {
        width: 100%;
        height: 300px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        position: relative;
    }

    .colorize__image_uploader>input {
        opacity: 0;
        position: absolute;
        left: 50%;
        top: 50%;
        margin-left: -100px;
        margin-top: -10px;
        cursor: pointer;
    }

    .colorize__image_container {
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 100px;
    }

    .colorize__image_container>img {
        max-width: 1000px;
        -webkit-box-shadow: 10px 10px 23px 0px rgba(0, 0, 0, 0.75);
        -moz-box-shadow: 10px 10px 23px 0px rgba(0, 0, 0, 0.75);
        box-shadow: 10px 10px 23px 0px rgba(0, 0, 0, 0.75);
    }

    .colorize__button_container {
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 100px;
        margin-bottom: 300px;
        transition: 2s;

    }

    .colorize__button_container>button {
        width: 150px;
        height: 70px;
        background-color: white;
        color: #3498db;
        border-radius: 15px;
        border: 0;
        font-size: 30px;
        -webkit-box-shadow: 10px 10px 23px 0px rgba(0, 0, 0, 0.75);
        -moz-box-shadow: 10px 10px 23px 0px rgba(0, 0, 0, 0.75);
        box-shadow: 10px 10px 23px 0px rgba(0, 0, 0, 0.75);
    }


    .invisible {
        opacity: 0;
    }
</style>

<body>
    <script>
        function previewFile() {
            var preview = document.querySelector('img'); // selectes the query named img
            var file = document.querySelector('input[type=file]').files[0]; // sames as here
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result; // base64
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }

            $(".colorize__button_container").attr('class', 'colorize__button_container');
            $("#colorize__image_uploader").css('display', 'none');

        }
    </script>
    <div class="colorize">
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
        <form action="/WebProject/routes/colorizeImages2.jsp" method="post">
            <div id="colorize__image_uploader" class="colorize__image_uploader">
                <input onchange="previewFile()" type="file" accept="image/*">
                <div>
                    Click here to upload image
                </div>
            </div>
            <div class="colorize__image_container">
                <img src="" alt="">
            </div>
            <div class="colorize__button_container invisible">
                <button>NEXT</button>
            </div>
        </form>
    </div>
</body>

</html>