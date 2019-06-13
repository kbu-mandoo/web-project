<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>colorize page</title>
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet" />
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
    align-items: flex-end;
  }

  .navigationContainer_left_logoOrName {
    margin-right: 50px;
    font-weight: 900;
    font-size: 25px;
    cursor: pointer;
  }

  .navigationContainer_left_logoOrName>a {
    font-weight: 900;
    font-size: 25px;
    cursor: pointer;
  }

  .navigationContainer_left_aTag__text>a {
    margin-right: 20px;
    cursor: pointer;
    font-size: 14px;
    width: 170px;
    height: 27px;
    display: flex;
    align-items: flex-end;
    transition: 0.2s ease-in-out;
  }

  .navigationContainer_left_aTag__text>a:hover {
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
    margin-left: -120px;
    margin-top: 50px;
    cursor: pointer;
  }

  .colorize__image_uploader>div {
    font-size: 16px;
    margin-top: 120px;
    font-weight: 400px;
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
    display: none;
    justify-content: center;
    align-items: center;
    margin-bottom: 200px;
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

  .colorize__radio_buttons_container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    position: relative;
    margin-top: 60px;
    margin-bottom: 100px;

  }

  .colorize__radio_buttons_container__input {
    display: flex;
    position: absolute;
    width: 250px;
    justify-content: space-between;
    opacity: 0;
  }

  .colorize__radio_buttons_container__input>input:first-child {
    width: 100px;
    cursor: pointer;
  }

  .colorize__radio_buttons_container__input>input:nth-child(2) {
    width: 80px;
    cursor: pointer;
  }

  .colorize_radio_buttons_container_text {
    display: flex;
    width: 250px;
    justify-content: space-between;
  }

  .checked {
    font-weight: 900;
    color: #74b9ff;
  }

  #current_page {
    color: #74b9ff;
  }
</style>

<body>
  <script>
    var base64fromclient;
    var reqvaluefromclient;

    /* function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    } */

    function previewFile() {
      var preview = document.querySelector('img'); // selectes the query named img
      var file = document.querySelector('input[type=file]').files[0]; // sames as here
      var reader = new FileReader();
      var stop = false;
      reader.onloadend = function () {
        var imagestring = reader.result;
        var extension = imagestring.substring(imagestring.indexOf('/') + 1, imagestring.indexOf(
          ';'));
        var base64str = reader.result.substr(19 + extension.length);
        var decoded = atob(base64str);
        var filesize = decoded.length;
        
        console.log('file size: ', filesize);

        if (filesize > 6291456) {
          stop = true

          alert("You can't upload image size over than 12MB")

        }

        if (!stop) {

          $("#colorize__image_uploader").css('display', 'none');
          $(".colorize__radio_buttons_container").attr('class', 'colorize__radio_buttons_container');
          preview.src = reader.result; // base64
          base64fromclient = reader.result;
        }




      };

      if (file) {
        reader.readAsDataURL(file);
      } else {
        preview.src = "";
      }



    }

    function clickRadioButton() {
      // When req1 is checked
      if (document.getElementById('req1').checked) {
        $("#stable").attr('class', '')
        $("#dynamic").attr('class', 'checked')
        $(".colorize__button_container").attr('class', 'colorize__button_container');
        $(".colorize__button_container").css('display', 'flex');
        reqvaluefromclient = document.getElementById('req1').value;
      }
      // When req2 is checked
      if (document.getElementById('req2').checked) {
        console.log('req2 checked')
        $("#dynamic").attr("class", '')
        $("#stable").attr('class', 'checked')
        $(".colorize__button_container").attr('class', 'colorize__button_container');
        $(".colorize__button_container").css('display', 'flex');
        reqvaluefromclient = document.getElementById('req2').value;
      }
    }

    function clickNEXTbutton() {
      console.log(!document.getElementById('req1').checked && !document.getElementById('req2').checked)

      if (!document.getElementById('req1').checked && !document.getElementById('req2').checked) {
        alert('You should select one of the modes')
        return false;
      }

      // Things to send server
      // 1. req
      // 2. image base64 string

      $(".form").append(`<input type="hidden" name="net" value=` + reqvaluefromclient + ` />` +
        `<input type="hidden" name="img" value=` + base64fromclient + ` />`
      )


      return true;
    }
  </script>
  <div class="colorize">
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
    <form class="form" onsubmit="return clickNEXTbutton()" action="/WebProject/routes/colorizeImages2.jsp"
      enctype="multipart/form-data" method="post">
      <div id="colorize__image_uploader" class="colorize__image_uploader">
        <input name="image" onchange="previewFile()" type="file" accept="image/*">
        <div>
          Click here to upload image!
        </div>
      </div>
      <div class="colorize__image_container">
        <img src="" alt="">
      </div>
      <div class="colorize__radio_buttons_container invisible">
        <div id="colorize__radio_buttons_container__input" class="colorize__radio_buttons_container__input">
          <input onclick="clickRadioButton()" id="req1" type="radio" value="0" name="req">
          <input onclick="clickRadioButton()" id="req2" type="radio" value="1" name="req">
        </div>
        <div class="colorize_radio_buttons_container_text">
          <div id="dynamic">Dynamic Mode</div>
          <div id="stable">Stable Mode</div>
        </div>
      </div>
      <div class="colorize__button_container invisible">
        <button>NEXT</button>
      </div>
    </form>
  </div>
</body>

</html>