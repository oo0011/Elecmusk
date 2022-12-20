<%--
/**
  Class Name: header.jsp
  Description:
  
  Modification information
  
    수정일     수정자      수정내용
  -----   -----  -------------------------------------------
    2022. 12. 13        최초작성 
    
    author eclass 개발팀 :ITSC
    since 2022.11.24
    Copyright (C) by KandJang All right reserved.
*/
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="RES" value="/resources"></c:set>
<c:set var="CP_RES" value="${CP}${RES}"></c:set>
<script type="text/javascript">
	$(document).ready(function() {

		$(".menu-bar").click(function() {
			$(".sub-menu").css("opacity", "1");
			$(".sub-menu").css("z-index", "1");
			$(".sub-menu").css("display", "block");
			$(".sub-menu>li").css("display", "block");
			$(".sub-menu>li>a").css("display", "block");
			$(".sub-menu>li").css("z-index", "1");
			$(".sub-menu>li>a").css("z-index", "1");
			$(".sub-menu").slideDown("fast");
			$()
		}).mouseleave(function() {
			$(".sub-menu").slideUp("fast");
			$(".sub-menu").css("opacity", "0");
			$(".sub-menu").css("z-index", "-1");
			$(".sub-menu").css("display", "none");
			$(".sub-menu>li").css("display", "none");
			$(".sub-menu>li>a").css("display", "none");
			$(".sub-menu>li").css("z-index", "-1");
			$(".sub-menu>li>a").css("z-index", "-1");
		});
		
    $("#main_home").on("click", function() {
        let link = "${CP}/elecmusk/view.do"
        location.href = link;
     });

     $("#mainhome,#logo").on("click", function() {
       let link = "${CP}/elecmusk/view.do"
       location.href = link;
     });
		
		onlyLoginUserUse();

	});
	
	function onlyLoginUserUse() {
		if(${null != sessionScope.userInfo.status && not empty sessionScope.userInfo}){
	     $("#carsData").on("click", function() {
	       let link = "${CP}/elecmusk/evcar.do"
	       location.href = link;
	     });
	     $("#subsidyData").on("click", function() {
	       let link = "${CP}/subsidy/view.do"
	       location.href = link;
	     });
	     $("#chargerData").on("click", function() {
	       let link = "${CP}/charger/view.do"
	       location.href = link;
	     });
	     $("#feeData").on("click", function() {
	       let link = "${CP}/chargingfee/view.do"
	       location.href = link;
	     });
	     $("#stationSearch").on("click", function() {
	       let link = "${CP}/station/view.do"
	       location.href = link;
	     });
	     $("#rvboard").on("click", function() {
	       let link = "${CP}/review/rvboardView.do?category=9"
	       location.href = link;
	     });
	     $("#board01").on("click", function() {
	       let link = "${CP}/board/boardView.do?category=1"
	       location.href = link;
	     });
	     $("#board02").on("click", function() {
	       let link = "${CP}/board/boardView.do?category=2"
	       location.href = link;
	     });
	     $("#board03").on("click", function() {
	       let link = "${CP}/board/boardView.do?category=5"
	       location.href = link;
	     });
	     $("#doLogout").on("click", function() {
	       let link = "${CP}/elecmusk/doLogout.do";
	       location.href = link;
	     });
	     $("#moveToMyPage").on("click", function() {
	       let link = "${CP}/elecmusk/myPage.do";
	       location.href = link;
	     });
		}
	} 
</script>
<style>
#header-area{
  border-bottom: 1px solid;
  width: 100%;
  display: flex;
}
</style>
<div class="container-fluid">
  <!-- login-area -->
    <div class="login-area">
    <c:choose>
      <c:when test="${null != sessionScope.userInfo && not empty sessionScope.userInfo}">
	      <p>환영합니다. <b>${sessionScope.userInfo.userId}</b>님
        <a id = "doLogout">[Logout]</a>
	      <a id = "moveToMyPage">[Mypage]</a></p>
      </c:when>
      <c:otherwise>
	      <a href="${CP}/elecmusk/login.do">[Login]</a>
      </c:otherwise>
    </c:choose>
    </div>
  <!-- login-area end ------------------------------------------------------->

	<!-- logo-area -->
	<div class="logo-area text-center">
		<img src="${CP_RES}/asset/imgs/home_imgs/EVerything_logo.png"
			id="logo">
	</div>
	<!-- logo-area end--------------------------------------------------------->

	<div class="header-area" id="header-area">
	<input type="hidden" id="status" name="status" value="${sessionScope.userInfo.status}">
  
		<div class="text-logo-area">
			<img src="${CP_RES}/asset/imgs/home_imgs/EVerything_logo_text.png" id="text-logo">
		</div>

		<!-- menu-area -->
		<div id="menu-area" class="container-fluid text-center">
			<ul class="menu-bar breadcrumb nav text-center">
				<li id="main_home" name="main_home">Home</li>
				<li>BOARD
					<ul class="sub-menu nav nav-stacked">
						<li><a id="board01">자유게시판</a></li>
						<li><a id="board02">결함 게시판</a></li>
						<li><a id="board03">공지사항</a></li>
					</ul>
				</li>
				<li>EVCARS
					<ul class="sub-menu nav nav-stacked">
						<li><a id="carsData" name="carsData">Cars data</a></li>
						<li><a id="subsidyData" name="subsidyData">Subsidy
								data</a></li>
						<li><a id="chargerData" name="chargerData">Charger
								data</a></li>
						<li><a id="feeData" name="feeData">Charging Fee</a></li>
						<li><a>Statistical info</a></li>
					</ul>
				</li>
				<li>STATION
					<ul class="sub-menu nav nav-stacked">
						<li><a id="stationSearch" name="stationSearch">Station</a></li>
						<li><a id="rvboard" name="rvboard">Review board</a></li>
					</ul>
				</li>
				<li>NEWS
					<ul class="sub-menu nav nav-stacked">
						<li><a>Menu 1</a></li>
						<li><a>Menu 2</a></li>
					</ul>
				</li>
			</ul>
		</div>

	</div>
</div>
