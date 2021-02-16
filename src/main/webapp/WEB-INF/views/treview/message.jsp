<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행후기 게시판</title>
<script src="${root}/resources/treview/assets/js/jquery.js"></script>
</head>
<body>
	<script>
		alert("${params.message}");
		$(parent.document).find("#treviewURL").val("${root}${params.redirect}");
		parent.fn_moveTreviewURL();
		//location.href = "${params.redirect}";
	</script>
</body>
</html>