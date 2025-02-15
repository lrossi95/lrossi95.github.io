<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <style>
    .compare-slider {
        position: relative;
        width: 1000px;
        height: 1000px;
        overflow: hidden;
        margin: 0 auto; /* This centers the slider horizontally */
    }

    .compare-slider .compare-image-before,
    .compare-slider .compare-image-after {
        position: absolute;
        width: 100%;
        height: 100%;
    }

    .compare-slider .compare-image-before img,
    .compare-slider .compare-image-after img {
        position: absolute;
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
        object-position: top left;
    }

    .compare-slider .compare-image-btn {
        position: absolute;
        z-index: 9;
        cursor: ew-resize;
        width: 54px;
        height: 54px;
        background-color: #fff;
        border-radius: 50%;
        box-shadow: 0 9px 18px 0 rgba(0,0,0,.2);
        border: solid 1.5px rgba(151,158,180,.15);
        box-sizing: border-box;
    }

    .compare-slider .compare-image-btn:before {
        content: "<";
        position: relative;
        display: inline-block;
        line-height: 54px;
        height: 54px;
        width: 50%;
        text-align: right;
    }

    .compare-slider .compare-image-btn:after {
        content: ">";
        position: relative;
        display: inline-block;
        line-height: 54px;
        height: 54px;
        width: 50%;
        text-align: left;
    }

    .compare-slider .compare-image-before:after {
        content: "";
        position: absolute;
        top: 0;
        right: 0;
        width: 3px;
        height: 100%;
        background-color: #fff;
        box-shadow: 0 0 14px 0 #000;
    }

    .compare-slider .before-label, .compare-slider .after-label {
        position: absolute;
        top: 50%;
        z-index: 159;
        line-height: 36px;
        background-color: #f8f9fc;
        color: #000;
        padding: 0 10px;
        min-width: 60px;
        transform: translateY(-50%);
        text-align: center;
    }

    .compare-slider .before-label {
        left: 15px;
    }

    .compare-slider .after-label {
        right: 15px;
    }

    body {
      font-family: Verdana, sans-serif;
      margin: 0;
      padding: 0;
    }
  </style>
</head>
<body>
  <div class="compare-slider">
    <div class="before-label"><span>2023</span></div>
    <div class="after-label"><span>2024</span></div>
    <div class="compare-image-after">
      <img src="../paper4/images/after.jpg" alt="After Image">
    </div>
    <div class="compare-image-before">
      <img src="../paper4/images/before.jpg" alt="Before Image">
    </div>
  </div>

  <script>
      function initComparisons() {
          var x, i;
          /*find all elements with an "overlay" class:*/
          x = document.getElementsByClassName("compare-image-before");
          for (i = 0; i < x.length; i++) {
              /*once for each "overlay" element:
              pass the "overlay" element as a parameter when executing the compareImages function:*/
              compareImages(x[i]);
          }

          function compareImages(img) {
              var slider, img, clicked = 0,
                  w, h;
              /*get the width and height of the img element*/
              w = img.offsetWidth;
              h = img.offsetHeight;
              /*set the width of the img element to 50%:*/
              img.style.width = (w / 2) + "px";
              /*create slider:*/
              slider = document.createElement("DIV");
              slider.setAttribute("class", "compare-image-btn");
              /*insert slider*/
              img.parentElement.insertBefore(slider, img);
              /*position the slider in the middle:*/
              slider.style.top = (h / 2) - (slider.offsetHeight / 2) + "px";
              slider.style.left = (w / 2) - (slider.offsetWidth / 2) + "px";
              /*execute a function when the mouse button is pressed:*/
              slider.addEventListener("mousedown", slideReady);
              /*and another function when the mouse button is released:*/
              window.addEventListener("mouseup", slideFinish);
              /*or touched (for touch screens:*/
              slider.addEventListener("touchstart", slideReady);
              /*and released (for touch screens:*/
              window.addEventListener("touchend", slideFinish);

              function slideReady(e) {
                  /*prevent any other actions that may occur when moving over the image:*/
                  e.preventDefault();
                  /*the slider is now clicked and ready to move:*/
                  clicked = 1;
                  /*execute a function when the slider is moved:*/
                  window.addEventListener("mousemove", slideMove);
                  window.addEventListener("touchmove", slideMove);
              }

              function slideFinish() {
                  /*the slider is no longer clicked:*/
                  clicked = 0;
              }

              function slideMove(e) {
                  var pos;
                  /*if the slider is no longer clicked, exit this function:*/
                  if (clicked == 0) return false;
                  /*get the cursor's x position:*/
                  pos = getCursorPos(e)
                      /*prevent the slider from being positioned outside the image:*/
                  if (pos < 0) pos = 0;
                  if (pos > w) pos = w;
                  /*execute a function that will resize the overlay image according to the cursor:*/
                  slide(pos);
              }

              function getCursorPos(e) {
                  var a, x = 0;
                  e = e || window.event;
                  /*get the x positions of the image:*/
                  a = img.getBoundingClientRect();
                  /*calculate the cursor's x coordinate, relative to the image:*/
                  x = e.pageX - a.left;
                  /*consider any page scrolling:*/
                  x = x - window.pageXOffset;
                  return x;
              }

              function slide(x) {
                  /*resize the image:*/
                  img.style.width = x + "px";
                  /*position the slider:*/
                  slider.style.left = img.offsetWidth - (slider.offsetWidth / 2) + "px";
              }
          }
      }

      initComparisons();
  </script>
</body>
</html>