<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>여행후기 게시판</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <link href="${root}/resources/treview/assets/css/bootstrap.css" rel="stylesheet">
  <link href="${root}/resources/treview/assets/css/bootstrap-responsive.css" rel="stylesheet">
  <link href="${root}/resources/treview/assets/css/prettyPhoto.css" rel="stylesheet">
  <link href="${root}/resources/treview/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
  <link href="${root}/resources/treview/assets/css/flexslider.css" rel="stylesheet">
  <link href="${root}/resources/treview/assets/css/style.css" rel="stylesheet">
  <link href="${root}/resources/treview/assets/color/default.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,600,400italic|Open+Sans:400,600,700" rel="stylesheet">

  <link rel="shortcut icon" href="${root}/resources/treview/assets/ico/favicon.ico">
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${root}/resources/treview/assets/ico/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${root}/resources/treview/assets/ico/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${root}/resources/treview/assets/ico/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="${root}/resources/treview/assets/ico/apple-touch-icon-57-precomposed.png">
  <script src="${root}/resources/treview/assets/js/jquery.js"></script>
  <script src="${root}/resources/treview/assets/js/raphael-min.js"></script>
  <script src="${root}/resources/treview/assets/js/jquery.easing.1.3.js"></script>
  <script src="${root}/resources/treview/assets/js/bootstrap.js"></script>
  <script src="${root}/resources/treview/assets/js/google-code-prettify/prettify.js"></script>
  <script src="${root}/resources/treview/assets/js/jquery.elastislide.js"></script>
  <script src="${root}/resources/treview/assets/js/jquery.prettyPhoto.js"></script>
  <script src="${root}/resources/treview/assets/js/jquery.flexslider.js"></script>
  <script src="${root}/resources/treview/assets/js/jquery-hover-effect.js"></script>
  <script src="${root}/resources/treview/assets/js/animate.js"></script>
  <script src="${root}/resources/treview/assets/js/custom.js"></script>

</head>


<body>
  <div id="wrapper">
  	<br><br>
    <section id="maincontent">
      <div class="container">
      	<div class="post-heading">
          <h3><a href="javascript: fn_moveTreviewURL('${root}/treview/list');">여행후기 상세</a></h3>
        </div>
        <div class="row">
          <div class="" style="width: 100%;">
            <article class="blog-post">
              <div class="post-heading">
                <h3><a href="#">[${treview.reviewtitle}]</a></h3>
              </div>
              <div class="clearfix">
              </div>
              <img class="resizeImgTarget" src="${treview.img_path}" alt="" onError="this.onerror=$(this).hide();" style="width: 100%;" onload="resizeImgOnload(this);" />
              <ul class="post-meta">
                <li class="first"><i class="icon-calendar"></i><span>${treview.reviewdatestr}</span></li>
                <li><i class="icon-comments"></i><span><a href="#">${treview.cnt_reply} comments</a></span></li>
                <li class="last"><i class="icon-tags"></i><span><a href="#">${treview.id}</a></span></li>
              </ul>
              <div class="clearfix">
              </div>
              <p style="word-break: break-all;">${fn:replace(treview.reviewcontent, newLineChar, "<br>")}</p>
              
              <c:if test="${(not empty authUser and authUser.id eq treview.id) or (not empty authUser and authUser.id eq 'admin')}">
              <button class="btn btn-theme" type="button" onclick="javascript: fn_moveTreviewURL('${root}/treview/write?key=${treview.reviewno}');">여행후기 수정하기</button>
              <button class="btn btn-theme" type="button" onclick="javascript: deleteTreview();">삭제하기</button>
              </c:if>
            </article>
            <c:if test="${fn:length(replyList) > 0}">
	            <h4>댓글목록</h4>
	            <ul class="media-list">
	              <c:forEach items="${replyList}" var="reply" varStatus="replySt">
		              <li class="media">
		                <a class="pull-left" href="#">
							<img class="media-object" src="${root}/resources/treview/assets/img/small-avatar.png" alt="" />
							</a>
		                <div class="media-body">
		                  <h5 class="media-heading"><a href="#">${reply.replier}</a></h5>
		                  <span>${reply.created_dt_str}</span>
		                  <p>${fn:replace(reply.reply, newLineChar, "<br>")}</p>
		                  <c:if test="${(not empty authUser and authUser.id eq reply.replier) or (not empty authUser and authUser.id eq 'admin')}">
		                  	<a href="javascript: deleteComment('${reply.replyno}');" class="reply">삭제</a>
		                  	<a href="javascript: modifyComment('${reply.replyno}', '${replySt.index}');" class="reply" style="margin-right: 1em;">수정</a>
		                  </c:if>
		                  <div class="clearfix"></div>
		                  <input type="hidden" id="replyArea${replySt.index}" value="${reply.reply}">
		                </div>
		              </li>
	              </c:forEach>
	            </ul>
            </c:if>
            <c:if test="${fn:length(replyList) > 0}">
	            <div class="row">
		          <div class="span12">
		            <div class="pagination">
		              <ul>
		              	<c:if test="${replyList[0].page ne 1}">
		                	<li><a href="javascript: fn_moveTreviewURL('${root}/treview/view?key=${treview.reviewno}&page=${replyList[0].page - 1}');">Prev</a></li>
		                </c:if>
		                
		                <c:forEach begin="${replyList[0].start_page}" end="${replyList[0].start_page + replyList[0].page_rows - 1}" var="page">
		                	<c:if test="${page <= replyList[0].cnt_page}">
		                		<li class="${page eq replyList[0].page ? 'active' : ''}"><a href="javascript: fn_moveTreviewURL('${root}/treview/view?key=${treview.reviewno}&page=${page}');">${page}</a></li>
		                	</c:if>
		                </c:forEach>
		                
		                <c:if test="${replyList[0].page ne replyList[0].cnt_page}">
		                	<li><a href="javascript: fn_moveTreviewURL('${root}/treview/view?key=${treview.reviewno}&page=${replyList[0].page + 1}');">Next</a></li>
		                </c:if>
		              </ul>
		            </div>
		          </div>
		        </div>
	        </c:if>
	        <c:if test="${not empty authUser}">
            <div class="comment-post">
              <h4>댓글작성</h4>
              <form action="${root}/treview/commentSave" id="params" name="params" method="post" class="comment-form" name="comment-form">
                <input type="hidden" id="reviewno" name="reviewno" value="${treview.reviewno}">
                <input type="hidden" id="replyno" name="replyno" value="">
                <input type="hidden" id="replier" name="replier" value="${authUser.id}">
                <div class="row">
                  <div class="span8">
                    <label>댓글 <span>*</span></label>
                    <textarea rows="9" id="reply" name="reply" class="input-block-level" placeholder="댓글 입력"></textarea>
                    <button class="btn btn-theme" type="button" onclick="javascript: save();">댓글 저장</button>
                  </div>
                </div>
              </form>
            </div>
            </c:if>
          </div>
        </div>
      </div>
    </section>
  </div>
  <a href="#" class="scrollup"><i class="icon-chevron-up icon-square icon-48 active"></i></a>
  <form action="${root}/treview/treviewDelete" id="delete" name="delete" style="display: none;" method="POST">
  	<input type="hidden" id="reviewno" name="reviewno" value="${treview.reviewno}">
  	<input type="hidden" id="replyno" name="replyno" value="">
  	<input type="hidden" id="type" name="type" value="">
  </form>

	<script>
		function save() {
			var reply = $.trim($("#reply").val());

			if (reply == null || reply == undefined || reply.length < 4) {
				alert("댓글을 4자 이상 입력하세요.");
				return false;
			}

			if (reply.length > 100) {
				alert("댓글은 100자 이내로 입력하세요.");
				return false;
			}

			$("#params").submit();
		}

		function deleteComment(key) {
			if (confirm("댓글을 삭제하시겠습니까?")) {
				$("#delete").find("#replyno").val(key);
				$("#delete").find("#type").val("comment");
				$("#delete").submit();
			}
		}

		function modifyComment(key, idx) {
			$("#params").find("#replyno").val(key);
			$("#params").find("#reply").val($("#replyArea" + $.trim(idx)).val());

			var offset = $(".comment-post").offset();
			$('html, body').animate({
				scrollTop : offset.top
			}, 400);
			$("#params").find("#reply").focus();
		}

		function deleteTreview() {
			if (confirm("여행후기를 삭제하시겠습니까?")) {
				$("#delete").find("#type").val("treview");
				$("#delete").submit();
			}
		}

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
	<%@ include file="/WEB-INF/views/treview/inner/script.jsp"%>

</body>
</html>









