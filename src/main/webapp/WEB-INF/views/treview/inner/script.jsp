<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
	function fn_moveTreviewURL($url) {
		$(parent.document).find("#treviewURL").val($url);
		parent.fn_moveTreviewURL();
	}

	function fn_resizeIframe() {
		$(parent.document).find("#treviewWidth").val(document.body.offsetWidth);
		$(parent.document).find("#treviewHeight").val(document.body.offsetHeight);
		parent.fn_resizeIframe();
	}

  	$(document).ready(function() {
  		fn_resizeIframe();
  	});
  	
  	$(window).resize(function() {
  		fn_resizeIframe();
  	});
</script>