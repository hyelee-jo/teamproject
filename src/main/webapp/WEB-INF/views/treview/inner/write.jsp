<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>여행후기 게시판</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <link href="/resources/treview/assets/css/bootstrap.css" rel="stylesheet">
  <link href="/resources/treview/assets/css/bootstrap-responsive.css" rel="stylesheet">
  <link href="/resources/treview/assets/css/prettyPhoto.css" rel="stylesheet">
  <link href="/resources/treview/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
  <link href="/resources/treview/assets/css/flexslider.css" rel="stylesheet">
  <link href="/resources/treview/assets/css/style.css" rel="stylesheet">
  <link href="/resources/treview/assets/color/default.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,600,400italic|Open+Sans:400,600,700" rel="stylesheet">
  <link rel="shortcut icon" href="/resources/treview/assets/ico/favicon.ico">
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/treview/assets/ico/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/resources/treview/assets/ico/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/resources/treview/assets/ico/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="/resources/treview/assets/ico/apple-touch-icon-57-precomposed.png">
  
  <script src="/resources/treview/assets/js/jquery.js"></script>
  <script src="/resources/treview/assets/js/raphael-min.js"></script>
  <script src="/resources/treview/assets/js/jquery.easing.1.3.js"></script>
  <script src="/resources/treview/assets/js/bootstrap.js"></script>
  <script src="/resources/treview/assets/js/google-code-prettify/prettify.js"></script>
  <script src="/resources/treview/assets/js/jquery.elastislide.js"></script>
  <script src="/resources/treview/assets/js/jquery.prettyPhoto.js"></script>
  <script src="/resources/treview/assets/js/jquery.flexslider.js"></script>
  <script src="/resources/treview/assets/js/jquery-hover-effect.js"></script>
  <script src="/resources/treview/assets/js/animate.js"></script>
  <script src="contactform/contactform.js"></script>
  <script src="/resources/treview/assets/js/custom.js"></script>

</head>

<body>
  <div id="wrapper">
  	<br><br>
    <section id="maincontent">
      <div class="container">
      	<div class="post-heading">
          <h3><a href="javascript: fn_moveTreviewURL('/treview/list');">여행후기 작성하기</a></h3>
        </div>
        <div class="row">
          <div class="" style="width: 100%;">
            <div class="spacer30">
            </div>
            <div id="sendmessage">Your message has been sent. Thank you!</div>
            <div id="errormessage"></div>
            <form action="/treview/writeSave" id="params" name="params" method="post" role="form" class="contactForm" enctype="multipart/form-data">
              <input type="hidden" id="reviewno" name="reviewno" value="${treview.reviewno}">
              <div class="row">
                <div class="form-group" style="width: 100%;">
                  <input type="text" class="input-block-level" name="reviewtitle" id="reviewtitle" value="${treview.reviewtitle}" placeholder="여행후기 제목 입력" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                  <div class="validation"></div>
                </div>
                <div class="form-group" style="width: 100%;">
                  <select id="orderno" name="orderno" style="width: 100%;">
                  	<c:forEach items="${orderlist}" var="order">
                  		<option value="${order.orderno}">${order.productname}, ${order.city}(${order.country})</option>
                  	</c:forEach>
                  </select>
                  <div class="validation"></div>
                </div>
                <div class="form-group" style="width: 100%;">
                  <textarea class="input-block-level" id="reviewcontent" name="reviewcontent" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="여행후기 내용 입력">${treview.reviewcontent}</textarea>
                  <div class="validation"></div>
                  <input type="file" name="imageFile" accept=".gif, .jpg, .jpeg, .png">
                  <div class="text-center">
                    <button class="btn btn-theme" type="button" onclick="javascript: save();">저장</button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
  </div>
  <a href="#" class="scrollup"><i class="icon-chevron-up icon-square icon-48 active"></i></a>
  
	<script>
		function save() {
			var reviewtitle = $.trim($("#reviewtitle").val());
			var reviewcontent = $.trim($("#reviewcontent").val());
			
			if (reviewtitle == null || reviewtitle == undefined || reviewtitle.length < 4) {
				alert("여행후기 제목을 4자 이상 입력하세요.");
				return false;
			}
			
			if (reviewtitle.length > 20) {
				alert("여행후기 제목을 20자 이내로 입력하세요.");
				return false;
			}
			
			if (reviewcontent == null || reviewcontent == undefined || reviewcontent.length < 10) {
				alert("여행후기 내용을 10자 이상 입력하세요.");
				return false;
			}
			
			if (reviewcontent.length > 1000) {
				alert("여행후기 내용을 1000자 이내로 입력하세요.");
				return false;
			}
			
			$("#params").submit();
		}
	</script>
	<%@ include file="/WEB-INF/views/treview/inner/script.jsp"%>


</body>
</html>









