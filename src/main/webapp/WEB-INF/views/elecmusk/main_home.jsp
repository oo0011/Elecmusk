<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="CP" value="${pageContext.request.contextPath}"/>
<c:set var="resources" value="/resources"/>
<c:set var="CP_RES"    value="${CP}${resources}" />

<fmt:bundle basename="message">
<%@include file="/resources/asset/jsp/cache.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initail-scale=1.0">
<meta name="description" content="pcwk html" />
<!-- 키워드 -->
<meta name="keyword" content="html5, css3, javascript6, jQuery">
<meta charset="UTF-8">
<!-- jquery ui -->
<link rel="stylesheet" href="${CP_RES}/asset/css/jquery-ui.css">
<link rel="stylesheet" href="${CP_RES}/main_home.css">
<style>

</style>
<title>Everything</title>
<script src="${CP_RES}/asset/js/jquery-3.6.1.min.js"></script>
<script src="${CP_RES}/asset/js/jquery-ui.js"></script>
<!-- javascript -->
<script type="text/javascript">
$(document).ready(function(){
    
    $(".menu-bar>li>a").on("click",function(){
        if($(".sub-menu").hasClass("visible") == false) {
           $(".sub-menu").addClass("visible");
           $(".sub-menu").css("opacity","1");
           $(".sub-menu").css("z-index","1");
           $(".sub-menu").slideDown("fast");
        } else {
           $(".sub-menu").slideUp("fast");
           $(".sub-menu").css("opacity","0");
           $(".sub-menu").css("z-index","-1");
           $(".sub-menu").removeClass("visible");
        }
        
        
     });
    
    
    
	   $(function() {
	     let didScroll;
	     let lastScrollTop = 0;
	     let navbarHeight = $("header").outerHeight();
	      $(window).scroll(function(event){
	          didScroll = true;
	      });

	      setInterval(function() {
	          if (didScroll) {
	              hasScrolled();
	              didScroll = false;
	          }
	      }); // 스크롤이 멈춘 후 동작이 실행되기 까지의 딜레이

	      function hasScrolled() {
	        if($(this).width() > 700) {       
	        let st = $(this).scrollTop(); // 현재 window의 scrollTop 값
	            if ($(window).scrollTop() > 50){
	                $(".logo-area").slideUp("fast"); // header 숨기기
	                $(".text-logo-area").addClass("visible");
	            } else {
	                if($(window).scrollTop() < 200) {
	                    $(".logo-area").slideDown("fast"); // header 보이기
	                    $(".text-logo-area").removeClass("visible");
	            }
	         }
	      }
	   }
	   });
	   
	   let idx = 0; // 함수 호출 횟수
	   let i=0; // 이미지 인덱스
	   let imgNum=3; // 이미지 개수
	   let imgSize=1200; // 이미지 크기
	   function imgSlide() {
	      idx = idx + 1; // 함수 호출 회수 증가
	     i=(idx-1)%imgNum; // 이미지는 3개를 돌려 쓸거라서
	     // idx-1을 해주는 이유 : idx>1 일 때부터 리스트 삭제, 추가가 이루어짐(1초 뒤부터 리스트 추가)
	     if(i==0){
	       i=imgNum; // 1,2,3,1,2,3 이 반복되어야 함
	     }
	     
	     $('.slide').css({"left":"0px"}); // 0 -> -imgSize을 반복하기 위해
	     
	       $('.slide').stop().animate({'left' : -imgSize+"px"}, "slow");
	     if(idx>1){ //idx>0으로 하면 첫 번째 리스트가 슬라이스되기전에 삭제가 된다.
	       $('.slide>li:first').remove(); // 제일 첫 <li> 삭제
	       $('.slide').append('<li><img src="${CP_RES}/asset/imgs/car'+i+'.jpg" alt="">');
	       //마지막에 <li> 추가
	     }
	     
	   }
	   // 3초에 한번 함수를 실행
	   setInterval(function() { imgSlide() }, 5000);
	   
	  });
</script>
</head>
<body>
  <header>
  <jsp:include page ="/resources/asset/cmn/main_header.jsp" flush="false"/>
  </header>
  <div id="contents">
  
   <div id="imgslide" class="all">
    <div class="imgbox">
      <ul class="slide">
        <li><img src="${CP_RES}/asset/imgs/car1.jpg" alt=""></li>
        <li><img src="${CP_RES}/asset/imgs/car2.jpg" alt=""></li>
        <li><img src="${CP_RES}/asset/imgs/car3.jpg" alt=""></li>
      </ul>
    </div>
  </div>
  
    <div id="contents-area">
      <div id="contents-1">
        <p>&nbsp;</p>
        <p>&nbsp;</p>
      </div>
      <div id="contents-2">
        <p>&nbsp;</p>
        <p>&nbsp;</p>
      </div>
      <div id="contents-3">
        <p>&nbsp;</p>
        <p>&nbsp;</p>
      </div>
      <div id="contents-4">
        <p>&nbsp;</p>
        <p>&nbsp;</p>
      </div>
      
    </div>

    
  </div>
<footer>
<jsp:include page ="/resources/asset/cmn/main_footer.jsp" flush="false"/>
</footer>
</body>
</html>
</fmt:bundle>