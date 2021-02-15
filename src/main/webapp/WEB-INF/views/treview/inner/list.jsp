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
  <script src="/resources/treview/assets/js/portfolio/jquery.quicksand.js"></script>
  <script src="/resources/treview/assets/js/portfolio/setting.js"></script>
  <script src="/resources/treview/assets/js/animate.js"></script>
  <script src="/resources/treview/assets/js/custom.js"></script>

</head>


<body>
  <div id="wrapper">
  	<br><br>
    <section id="maincontent">
      <div class="container">
      	<div class="post-heading">
          <h3><a href="javascript: fn_moveTreviewURL('/treview/list');">여행후기 목록</a></h3>
        </div>
        <div class="row" style="border-left: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black;">
          <ul class="portfolio-area da-thumbs">
            <c:forEach items="${treviewList}" var="treview" varStatus="treviewSt">
	            <li class="portfolio-item" data-id="id-0" data-type="web" style="border-top: 1px solid black; padding-top: 1em;">
	              <div class="span3">
	                <div class="thumbnail">
	                  <div class="image-wrapp">
	                    <img class="listImgTag" src="/treview/download/${treview.img_key}" alt="Portfolio name" title="" class="location${treview.reviewno}" onError="this.onerror=null;this.src='/resources/treview/assets/img/noimage.gif'" onload="resizeImgOnload(this);" />
	                    <article class="da-animate da-slideFromRight">
	                      <a class="zoom" data-pretty="" href="javascript: detailImageView('${treview.reviewno}');">
								<i class="icon-zoom-in icon-rounded icon-48 active"></i>
								</a>
	                      <div class="hidden-tablet">
	                        <p>상세보기</p>
	                      </div>
	                    </article>
	                  </div>
	                </div>
	                <div class="thumbnailDesc">
	                	<div class="title" data-key="${treview.reviewno}">[${treview.reviewno}] ${treview.reviewtitle}</div>
	                	<div class="content" data-key="${treview.reviewno}" style="word-break: break-all; max-width: 600px;">[요약]<br>${treview.reviewcontentshort}</div>
	                	<ul class="post-meta" data-key="${treview.reviewno}">
			              <li class="first"><i class="icon-calendar"></i><span>${treview.reviewdatestr}</span></li>
			              <li><i class="icon-comments"></i><span><a href="#">${treview.cnt_reply} comments</a></span></li>
			              <li class="last"><i class="icon-tags"></i><span><a href="#">${treview.id}</a></span></li>
			            </ul>
	                </div>
	              </div>
	            </li>
	            <br>
            </c:forEach>
          </ul>
        </div>
        <div class="row">
          <div class="span12">
            <div class="pagination">
              <ul>
              	<li><a href="javascript: fn_moveTreviewURL('/treview/write');">여행후기 작성하기</a></li>
              </ul>
            </div>
          </div>
        </div>
        <c:if test="${fn:length(treviewList) > 0}">
	        <div class="row">
	          <div class="span12">
	            <div class="pagination">
	              <ul>
	              	<c:if test="${treviewList[0].page ne 1}">
	                	<li><a href="javascript: fn_moveTreviewURL('/treview/list?page=${treviewList[0].page - 1}');">Prev</a></li>
	                </c:if>
	                
	                <c:forEach begin="${treviewList[0].start_page}" end="${treviewList[0].start_page + treviewList[0].page_rows - 1}" var="page">
	                	<c:if test="${page <= treviewList[0].cnt_page}">
	                		<li class="${page eq treviewList[0].page ? 'active' : ''}"><a href="javascript: fn_moveTreviewURL('/treview/list?page=${page}');">${page}</a></li>
	                	</c:if>
	                </c:forEach>
	                
	                <c:if test="${treviewList[0].page ne treviewList[0].cnt_page}">
	                	<li><a href="javascript: fn_moveTreviewURL('/treview/list?page=${treviewList[0].page + 1}');">Next</a></li>
	                </c:if>
	              </ul>
	            </div>
	          </div>
	        </div>
        </c:if>
      </div>
    </section>

  </div>
  <a href="#" class="scrollup"><i class="icon-chevron-up icon-square icon-48 active"></i></a>
  
  <script>
  	function detailImageView(rnum) {
  		fn_moveTreviewURL("/treview/view?key=" + rnum);
  		//location.href = "/treview/view?key=" + rnum;
  	}
  	
  	$(".thumbnailDesc").find(".title, .content, .post-meta").click(function(e) {
  		e.preventDefault();
  		
  		var $key = $(this).attr("data-key");
  		fn_moveTreviewURL("/treview/view?key=" + $key);
  		//location.href = "/treview/view?key=" + $key;
  	});
  	
  	function resizeImgOnload($this) {
  		var $width;
  		var $height;
		$width = $($this).width();
		$height = $($this).height();
		if ($width <= $height) {
	  		$($this).css("height", $width);
	  	}
  	}
  	
  	function resizeImg() {
  		var $width;
  		var $height;
  		$(".resizeImgTarget").each(function() {
  			$width = $(this).width();
  			$height = $(this).height();
  			if ($width <= $height) {
  	  			$(this).css("height", $width);
  	  		}
  		});
  	}
  	
  	$(window).resize(function() {
  		resizeImg();
  	});
  </script>
  <%@ include file="/WEB-INF/views/treview/inner/script.jsp" %>

</body>
</html>









