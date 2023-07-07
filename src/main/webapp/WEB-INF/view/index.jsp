<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="aisw.web.board.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>


#board {
  border-collapse: collapse;
  width: 100%;
  margin-top: 20px;
}

 #board {
  border: 1px solid #ccc;
}

#board th, #board td {
  padding: 10px;
  text-align: left;
}

#board tr:nth-child(even) {
  background-color: #f9f9f9;
}

#board tr:hover {
  background-color: #e6e6e6;
}

button {
  background: none;
  border: none;
  color: blue;
  cursor: pointer;
}

#insert {
  margin-top: 20px;
  text-align: right;
}

#insert a {
  color: black;
  text-decoration: none;
  padding: 10px 20px;
  background-color: #ddd;
  border-radius: 4px;
}

#insert a:hover {
  background-color: #ccc;
}
#top{
	background-color : rgb(197,233,254);
	position : relative;
}

#top_menu{
	position : absolute;
	right : 0;
	top: 10px;
	font-weight : bold;
}

#top_menu a {
	text-decoration: none;
	color : black;
}
</style>

</head>
<body>

<table id="top_menu">
	<tr >
		<td><a href="${pageContext.request.contextPath }/main.do">Home  |</a>
		    <a href="${pageContext.request.contextPath }/board.do">게시판 |</a>
			<a href="${pageContext.request.contextPath }/productbtn.do">상품 |</a> 
			<c:if test="${user.id =='banker'}">
			<a href="${pageContext.request.contextPath }/productbtnBanker.do">상품관리 |</a>
			</c:if> 
			<c:if test="${empty user}">
			<a href="${pageContext.request.contextPath }/login.do">로그인 |</a> 			
			</c:if>
			
			<c:if test="${not empty user}">
			<a href="${pageContext.request.contextPath }/accountlist.do">MyAccount  |</a> 			
			</c:if>
			<c:if test="${not empty user}">
			<a href="${pageContext.request.contextPath }/logout.do">로그아웃</a> 			
			</c:if>
			<c:if test="${empty user}">
			<a href="${pageContext.request.contextPath }/signbutton.do">회원가입</a>
			</c:if>
	</tr>
</table>
<br><br>
<table border="1" id="board">
	<tr>
		<td>no</td>
		<td>제목</td>
		<td>글쓴이</td>
		<td>작성날짜</td>
	</tr>
	
	<c:forEach var="board" items="${boardList}">
		<tr>
			<td>${board.boardID }</td>
			<td><a href="${pageContext.request.contextPath}/index/${board.boardID}">${board.title}</a></td>
			<td>${board.writer }</td>
			<td>
			${board.regDate }
			<input type="button" value="X">
			</td>
		</tr>
	</c:forEach>
</table>
<br>

<div id="insert">
	<c:choose>
		<c:when test="${empty sessionScope.user.id}">
			<a href="#" style="color:black;" onclick="showAlert()">글쓰기</a>
		</c:when>
		<c:otherwise>
			<a href="insertboardbtn.do" style="color:black;">글쓰기</a>
		</c:otherwise>
	</c:choose>
</div>

<!-- 
<%-- 페이징 테이블 --%>
<table width="70%">
	<tr>
		<td>
			<c:forEach var="i" begin="1" end="${lastPage}">
				<c:if test="${i eq pageNo}">
					<strong>[${i}]</strong>
				</c:if>
				<c:if test="${i ne pageNo}">
					<a href="board.do?pageNo=${i}">[${i}]</a>
				</c:if>
			</c:forEach>	
		</td>
	</tr>	
</table>
 -->
<script>
  // JavaScript code omitted for brevity
</script>

</body>
</html>
