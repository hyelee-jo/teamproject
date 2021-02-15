<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>여행후기 게시판</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <link rel="stylesheet" href="${root}/resources/assets/css/reset.css">
  <link rel="stylesheet" href="${root}/resources/assets/css/style.css">
  <link rel="stylesheet" href="${root}/resources/assets/css/swiper.css">
  
  <script src="/resources/treview/assets/js/jquery.js"></script>
  
</head>


<body>
<u:navbar></u:navbar>
	<%@ include file="/WEB-INF/views/treview/iframe.jsp" %>
<u:footer></u:footer>
</body>
</html>









