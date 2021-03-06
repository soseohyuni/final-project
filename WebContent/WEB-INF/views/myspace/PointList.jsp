<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 포인트</title>
<link href="<%=cp%>/css/myspace.css" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
// 페이지 번호만 속성값으로 가지도록 <a> 태그가 작동하지 못하도록 처리
//-- 실제 페이지를 클릭하면 동작하는 부분은 <form> 태그를 이용해 처리함
$(document).ready(function()
{
   var pointForm = $("#pointForm");
   
   $(".paginate_button a").on("click", function(e)
   {
      // <a> 태그 선택해도 페이지 이동 없도록 처리
      e.preventDefault();
      
      // <form> 태그 내 pageNum 속성 값은 href 속성값(클릭한 페이지 번호)으로 변경
      pointForm.find("input[name='pageNum']").val($(this).attr("href"));
      pointForm.submit();
   });
});
</script>
</head>
<body>
<!-- 메뉴 영역 -->
	<div>
		<c:import url="/WEB-INF/views/main/header.jsp"></c:import>
	</div>
	
	<div id="wrapper">
		<div class="container">
			<div id="pageTitle" class="container">나의 포인트 내역</div>
			<div id="topBox" class="inBox">
				<div class="mTitle">현재 내 포인트 : ${userPoint }P</div>
				<div class="grade">${sessionScope.nick }님은 <b>${sessionScope.grade }</b> 등급입니다.</div>
			</div>
			<table id="cashTable" class="table table-hover">
			<tr>
				<th>번호</th>
				<th>적립/차감</th>
				<th></th>
				<th style="text-align: center;">적립/차감 포인트</th>
				<th style="text-align: center;">총 포인트</th>
			</tr>
			
			<c:forEach var="checkList" items="${checkList }">
					<tr>
						<td>${checkList.bno }</td>
						<td>${checkList.point_y }</td>
						<td style="color: #bfbfbf;">${checkList.point_dt }</td>
							<c:choose>
							<c:when test = "${fn:contains(checkList.point, '-')}">
						        <td style="color: red; text-align: center;">${checkList.point }</td>
						    </c:when>
						    <c:otherwise>
						     	<td style="color: blue; text-align: center;">${checkList.point }</td>
						    </c:otherwise>
					    </c:choose>
						<td style="text-align: center;">${checkList.user_point }</td>
					</tr>
			</c:forEach>
			
			</table>
			

			<!--  페이징 추가 -->
				<div class="pull-right">
					<ul class="pagination">
					<c:if test="${checkPageMaker.prev }">
						<li class="paginate_button previous"><a href="${checkPageMaker.startPage-1 }">Previous</a>
						</li>
					</c:if>
					
					<c:forEach var="num" begin="${checkPageMaker.startPage }" end="${checkPageMaker.endPage }">
						<li class="paginate_button"><a href="${num }">${num }</a></li>
					</c:forEach>
					
					<c:if test="${checkPageMaker.next }">
						<li class="paginate_button next"><a href="${checkPageMaker.endPage+1 }">Next</a></li>
					</c:if>
					</ul>
				</div><!-- close .pull-right -->
				<!-- 페이지 번호 클릭시 이동을 위한 hidden form 구성 -->
				<form id="pointForm" action="pointlist.action" method="get">
					<input type="hidden" name="pageNum" value="${checkPageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${checkPageMaker.cri.amount }">
				</form>
		    </div><!-- row -->

		</div>
	
</body>
</html>