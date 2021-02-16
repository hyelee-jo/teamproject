<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<input type="hidden" id="treviewURL" name="treviewURL">
<input type="hidden" id="treviewWidth" name="treviewWidth">
<input type="hidden" id="treviewHeight" name="treviewHeight">
<script>
	function fn_moveTreviewURL() {
		location.href = $("#treviewURL").val();
	}

	function fn_resizeIframe() {
		$("#treviewIfame").width($("#treviewWidth").val());
		$("#treviewIfame").height(parseInt($("#treviewHeight").val()) + 100);
	}
	
	function fn_treviewScrollUp() {
		$("html, body").animate({scrollTop: 0}, 600);
	}

	$(window).resize(function() {
		$("#treviewIfame").width(document.body.offsetWidth);
	});
</script>

<section>
<c:set var="targetUrlList" value="${root}/treview/list" />
<c:set var="targetUrlView" value="${root}/treview/view" />
<c:set var="targetUrlWrite" value="${root}/treview/write" />
<c:choose>
	<c:when test="${requestUri eq targetUrlList}">
		<iframe id="treviewIfame" src="${root}/treview/inner/list${getParamSet}" style="display: block; border: none; height: 100vh; width: 100vw; overflow-x: hidden; overflow-y: hidden;"></iframe>
	</c:when>
	<c:when test="${requestUri eq targetUrlView}">
		<iframe id="treviewIfame" src="${root}/treview/inner/view${getParamSet}" style="display: block; border: none; height: 100vh; width: 100vw; overflow-x: hidden; overflow-y: hidden;"></iframe>
	</c:when>
	<c:when test="${requestUri eq targetUrlWrite}">
		<iframe id="treviewIfame" src="${root}/treview/inner/write${getParamSet}" style="display: block; border: none; height: 100vh; width: 100vw; overflow-x: hidden; overflow-y: hidden;"></iframe>
	</c:when>
</c:choose>
</section>









