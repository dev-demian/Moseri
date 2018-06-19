<!DOCTYPE html>
<html lang="ko">



<head>
  <title>slickslide</title>
  <meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
  <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />

  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  <!--    <script type="text/javascript" src="slick/slick.min.js"></script>-->
  <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>





  <style media="screen">
    @import url(./css/btn.css) ;
   



    html,div,body{
      border: 1px solid red;

    }
    header{
      border: 1px solid red;
    }


#bg1{
      width: 580px;
      height: 580px;
      background-image: url("${pageContext.request.contextPath}/res/img/nomal1.png") ;
      background-size: contain;
    }
    
  #bg2{
      width: 580px;
      height: 580px;
      background-image: url("${pageContext.request.contextPath}/res/img/master.png");
      background-size: contain;
    }

  </style>

  <script>
    $( document ).ready(function() {
        
      $('#bg1').on( "click", function() {
        console.log( "click1" );
        location.replace('register');
    });
      $('#bg2').on( "click", function() {
        console.log( "click2" );
        location.replace('register_gosu');
    });


    });
  </script>

</head>


<body>



  <div class="container">
    <div class="row">
     <div id="bg1" class="col-sm-6"> </div><!---->
     <div id="bg2" class="col-sm-6"> </div><!---->
   </div>
 </div>






</body>
</html>