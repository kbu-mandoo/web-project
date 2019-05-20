<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link
      href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
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
      }
      .perspectiveTransform__container {
        background-color: #2c3e50;
        min-width: 100vw;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        color: white;
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
      .navigationContainer_right {
      }
      .navigationContainer_right_logout {
        display: flex;
        align-items: flex-end;
        cursor: pointer;
      }
      /* to here, navigation bar css */
      .perspectiveTransform__container__body {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding-top: 50px;
        padding-bottom: 150px;
      }
      .perspectiveTransform__container__body__file_input_container {
        position: relative;
      }
      .perspectiveTransform__container__body__file_input {
        position: absolute;
        opacity: 0;
        width: 210px;
        cursor: pointer;
      }
      .perspectiveTransform__container__body__img {
        -webkit-box-shadow: 10px 10px 32px 0px rgba(0, 0, 0, 0.75);
        -moz-box-shadow: 10px 10px 32px 0px rgba(0, 0, 0, 0.75);
        box-shadow: 10px 10px 32px 0px rgba(0, 0, 0, 0.75);
        /* z-index: 3; */
      }
      .perspectiveTransform__container__body__img_container {
        position: relative;
        overflow-x: auto;
        text-align: center;
        max-width: 100%;
        /* z-index: 4; */
      }
      .perspectiveTransform__container__body__img_container__canvas {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        border: 1px solid white;
        background: transparent;
      }
      .perspectiveTransform__container__body__file_input_container_text_button {
        width: 210px;
        margin-bottom: 40px;
      }
      .perspectiveTransform__container__body_button {
        width: 150px;
        height: 50px;
        font-size: 30px;
        color: white;
        background-color: #3498db;
        border: 0;
        border-radius: 5px;
        margin-top: 40px;
        -webkit-box-shadow: 10px 10px 20px 0px rgba(0, 0, 0, 0.75);
        -moz-box-shadow: 10px 10px 20px 0px rgba(0, 0, 0, 0.75);
        box-shadow: 10px 10px 20px 0px rgba(0, 0, 0, 0.75);
        cursor: pointer;
      }
    </style>
  </head>
  <%
  	
  %>
  <script>
    var point1 = { x: null, y: null };
    var point2 = { x: null, y: null };
    var point3 = { x: null, y: null };
    var point4 = { x: null, y: null };
    var file = null;
    var base64 = null;
    function previewFile() {
      var preview = document.querySelector("img"); // img 태그를 선택한다.
      var imageContainer = $(
        ".perspectiveTransform__container__body__img_container"
      );
      file = document.querySelector("input[type=file]").files[0]; // input 타입이 file 인 태그에서의 첫번째 파일을 가져온다.
      var reader = new FileReader();
      reader.onloadend = function() {
        preview.src = reader.result; // base64 파일
        base64 = reader.result;
        imageContainer.background = reader.result;
      };
      if (file) {
        reader.readAsDataURL(file);
      } else {
        preview.src = "";
      }
    }
    previewFile();
    function clickOnTheImage() {
      if (point1.x == null && point1.y == null) {
        point1.x = event.offsetX;
        point1.y = event.offsetY;
        $(".perspectiveTransform__container__body__img_container").append(
          $(
            `<div class="point1" draggable="true" ondrag="dragPoint(event)" ondragend="dragEnd(event)"></div>`
          )
            .css({
              position: "absolute",
              top: point1.y - 5 + "px",
              left: point1.x - 5 + "px",
              width: "10px",
              height: "10px",
              background: "white"
            })
            .css("border-radius", "50%")
            .css("z-index", "3")
        );
      } else if (point2.x == null && point2.y == null) {
        point2.x = event.offsetX;
        point2.y = event.offsetY;
        $(".perspectiveTransform__container__body__img_container").append(
          $(
            `<div class="point2" draggable="true" ondrag="dragPoint(event)" ondragend="dragEnd(event)"></div>`
          )
            .css({
              position: "absolute",
              top: point2.y - 5 + "px",
              left: point2.x - 5 + "px",
              width: "10px",
              height: "10px",
              background: "white"
            })
            .css("border-radius", "50%")
            .css("z-index", "3")
        );
        createLine(point1.x, point1.y, point2.x, point2.y, "line1");
      } else if (point3.x == null && point3.y == null) {
        point3.x = event.offsetX;
        point3.y = event.offsetY;
        $(".perspectiveTransform__container__body__img_container").append(
          $(
            `<div class="point3" draggable="true" ondrag="dragPoint(event)" ondragend="dragEnd(event)"></div>`
          )
            .css({
              position: "absolute",
              top: point3.y - 5 + "px",
              left: point3.x - 5 + "px",
              width: "10px",
              height: "10px",
              background: "white"
            })
            .css("border-radius", "50%")
            .css("z-index", "3")
        );
        createLine(point2.x, point2.y, point3.x, point3.y, "line2");
      } else if (point4.x == null && point4.y == null) {
        point4.x = event.offsetX;
        point4.y = event.offsetY;
        $(".perspectiveTransform__container__body__img_container").append(
          $(
            `<div class="point4" draggable="true" ondrag="dragPoint(event)" ondragend="dragEnd(event)"></div>`
          )
            .css({
              position: "absolute",
              top: point4.y - 5 + "px",
              left: point4.x - 5 + "px",
              width: "10px",
              height: "10px",
              background: "white"
            })
            .css("border-radius", "50%")
            .css("z-index", "3")
        );
        createLine(point3.x, point3.y, point4.x, point4.y, "line3");
        createLine(point4.x, point4.y, point1.x, point1.y, "line4");
      }
      // else {
      //   alert("모든 점의 좌표를 클릭하였습니다. ");
      // }
    }
    function createLine(x1, y1, x2, y2, lineId) {
      // the distance between the two points(for the line div width)
      distance = Math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
      // the mid-point between the two points, we use it as rotation center
      xMid = (x1 + x2) / 2;
      yMid = (y1 + y2) / 2;
      // get the salope of the line between two points
      salopeInRadian = Math.atan2(y1 - y2, x1 - x2);
      salopeInDegree = (salopeInRadian * 180) / Math.PI;
      // change the css of the line
      line = document.getElementById(lineId);
      line.style.width = distance + "px";
      line.style.top = yMid + "px";
      line.style.left = xMid - distance / 2 + "px";
      line.style.border = "1px solid white";
      line.style.transform = "rotate(" + salopeInDegree + "deg)";
      line.style.position = "absolute";
    }
    function dragPoint(e) {
      if (point4.x == null) {
        return;
      }
      var classname = e.target.className;
      var point = e.target;
      var pointsXOffSet = e.pageX;
      var pointsYOffSet = e.pageY;
      var container = $(
        ".perspectiveTransform__container__body__img_container"
      ).offset();
      point.style.background = "transparent";
      if (pointsXOffSet == 0 || pointsYOffSet == 0) {
        return;
      }
      var imageContainerLeftOffset = container.left;
      var imageContainerTopOffset = container.top;
      var relativeXOffset = pointsXOffSet - imageContainerLeftOffset;
      var relativeYOffset = pointsYOffSet - imageContainerTopOffset;
      if (classname == "point1") {
        point1.x = relativeXOffset;
        point1.y = relativeYOffset;
        createLine(point1.x, point1.y, point2.x, point2.y, "line1");
        createLine(point4.x, point4.y, point1.x, point1.y, "line4");
      } else if (classname == "point2") {
        point2.x = relativeXOffset;
        point2.y = relativeYOffset;
        createLine(point2.x, point2.y, point3.x, point3.y, "line2");
        createLine(point1.x, point1.y, point2.x, point2.y, "line1");
      } else if (classname == "point3") {
        point3.x = relativeXOffset;
        point3.y = relativeYOffset;
        createLine(point3.x, point3.y, point4.x, point4.y, "line3");
        createLine(point2.x, point2.y, point3.x, point3.y, "line2");
      } else if (classname == "point4") {
        point4.x = relativeXOffset;
        point4.y = relativeYOffset;
        createLine(point4.x, point4.y, point1.x, point1.y, "line4");
        createLine(point3.x, point3.y, point4.x, point4.y, "line3");
      }
    }
    function dragEnd(e) {
      if (point4.x == null) {
        return;
      }
      var point = e.target;
      var classname = e.target.className;
      var pointsXOffSet = e.pageX;
      var pointsYOffSet = e.pageY;
      var container = $(
        ".perspectiveTransform__container__body__img_container"
      ).offset();
      var imageContainerLeftOffset = container.left;
      var imageContainerTopOffset = container.top;
      var relativeXOffset = pointsXOffSet - imageContainerLeftOffset;
      var relativeYOffset = pointsYOffSet - imageContainerTopOffset;
      point.style.top = relativeYOffset - 5 + "px";
      point.style.left = relativeXOffset - 5 + "px";
      point.style.background = "white";
      if (classname == "point1") {
        point1.x = relativeXOffset;
        point1.y = relativeYOffset;
        createLine(point1.x, point1.y, point2.x, point2.y, "line1");
        createLine(point4.x, point4.y, point1.x, point1.y, "line4");
      } else if (classname == "point2") {
        point2.x = relativeXOffset;
        point2.y = relativeYOffset;
        createLine(point2.x, point2.y, point3.x, point3.y, "line2");
        createLine(point1.x, point1.y, point2.x, point2.y, "line1");
      } else if (classname == "point3") {
        point3.x = relativeXOffset;
        point3.y = relativeYOffset;
        createLine(point3.x, point3.y, point4.x, point4.y, "line3");
        createLine(point2.x, point2.y, point3.x, point3.y, "line2");
      } else if (classname == "point4") {
        point4.x = relativeXOffset;
        point4.y = relativeYOffset;
        createLine(point4.x, point4.y, point1.x, point1.y, "line4");
        createLine(point3.x, point3.y, point4.x, point4.y, "line3");
      }
    }
    
    function onclickSubmit() {
    	if(point1.x == null || point1.y == null || point2.x == null || point2.y == null || point3.x == null || 
        point3.y == null || point4.x == null || point4.y == null || file == null || base64 == null
        ){
            return false;
        }

        $(".form").append(`<input type="hidden" name="point1x" value=`+point1.x+` />`+ 
        `<input type="hidden" name="point1y" value=`+point1.y+` />`+
        `<input type="hidden" name="point2x" value=`+point2.x+` />`+
        `<input type="hidden" name="point2y" value=`+point2.y+` />`+
        `<input type="hidden" name="point3x" value=`+point3.x+` />`+
        `<input type="hidden" name="point3y" value=`+point3.y+` />`+
        `<input type="hidden" name="point4x" value=`+point4.x+` />`+
        `<input type="hidden" name="point4y" value=`+point4.y+` />`+
        `<input type="hidden" name="base64" value=`+base64+` />`);


        return true;
    }
  </script>

  <body>
    <div class="perspectiveTransform__container">
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
      <div class="perspectiveTransform__container__body">
        <div
          class="perspectiveTransform__container__body__file_input_container"
        >
        <form action="http://localhost:8080/WebProject/routes/perspectiveTransform2.jsp" onsubmit="return onclickSubmit()" class="form" method="POST">
          <input
            type="file"
            name="image"
            class="perspectiveTransform__container__body__file_input"
            onchange="previewFile()"
            
          />
          
          <div
            class="perspectiveTransform__container__body__file_input_container_text_button"
          >
            Click here to upload image!
          </div>
        </div>
        <div
          draggable="false"
          class="perspectiveTransform__container__body__img_container"
        >
          <img
            src="#"
            class="perspectiveTransform__container__body__img"
            alt="preview image"
            onclick="clickOnTheImage()"
            draggable="false"
          />

          <div class="line" id="line1"></div>
          <div class="line" id="line2"></div>
          <div class="line" id="line3"></div>
          <div class="line" id="line4"></div>
        </div>

        <button class="perspectiveTransform__container__body_button">
          NEXT
        </button>
        </form>
      </div>
    </div>
  </body>
</html>