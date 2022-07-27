<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href='<c:url value="/"/>'>스프1탄</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href='<c:url value="/"/>'>Home</a></li>
        <li><a href='<c:url value="/boardMain.do"/>'>게시판</a></li>
        <li><a href="#">Page 2</a></li>
      </ul>
      <c:choose>
      	<c:when test="${empty mvo}">
   		  <ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
	          <a class="dropdown-toggle" data-toggle="dropdown" href="#">접속하기<span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href='<c:url value="/memLoginForm.do"/>'>로그인</a></li>
	            <li><a href='<c:url value="/memJoin.do"/>'>회원가입</a></li>
	          </ul>
	        </li>
	      </ul>
      	</c:when>
      	<c:otherwise>
      	  <ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
	          <a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리<span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href='<c:url value="/updateUserInfo.do"/>'>회원정보수정</a></li>
	            <li><a href="#">프로필사진등록</a></li>
	            <li><a href='<c:url value="/memLogout.do"/>'>로그아웃</a></li>
	          </ul>
	        </li>
	      </ul>
      	</c:otherwise>
      </c:choose>
    </div>
  </div>
</nav>