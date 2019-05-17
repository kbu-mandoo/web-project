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
        color: white;
      }
      .SignUp-container {
        background-color: #2c3e50;
        width: 100vw;
        height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
      }
      .SignUp-container--card-button {
        border: 0;
        background-color: transparent;
        color: white;
        cursor: pointer;
      }
      .SignUp-container--card--big-text-input {
        border: 0;
        border-radius: 3px;
        padding: 5px;
        margin-top: 5px;
        margin-bottom: 5px;
      }
    </style>
  </head>
  <script src="./index.js"></script>
  <body>
    <div class="SignUp-container">
      <div class="SignUp-container--card">
        <div class="SignUp-container--card--big-text">
          SIGN IN
        </div>
        <input
          type="text"
          name="username"
          class="SignUp-container--card--big-text-input"
          placeholder="username"
        />
        <input
          type="password"
          name="password"
          placeholder="password"
          class="SignUp-container--card--big-text-input"
        />
        <button class="SignUp-container--card-button">SUBMIT</button>

        <div class="SignUp-container--signin">
          <a href="http://localhost:8080/WebProject/index.jsp?route=signUp">
            NO ACCOUNT?
          </a>
        </div>
      </div>
    </div>
  </body>
</html>
