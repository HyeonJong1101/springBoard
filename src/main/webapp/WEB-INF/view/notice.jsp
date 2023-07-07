<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        a {
            color: #0000EE;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        input[type="button"] {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            font-size: 14px;
        }
    </style>
</head>
<body>
    상세페이지
    <table border="1" id="board">
        <tr>
            <td>no</td>
            <td>제목</td>
            <td>글내용</td>
            <td>글쓴이</td>
            <td>작성날짜</td>
        </tr>
        
        <c:forEach var="board" items="${boardList}">
            <c:if test="${board.boardID eq no}">
                <tr>
                    <td>${board.boardID}</td>
                    <td><a href="${pageContext.request.contextPath}/index/${board.boardID}">${board.title}</a></td>
                    <td>${board.content}</td>
                    <td>${board.writer}</td>
                    <td>
                        ${board.regDate}
                        <input type="button" value="X">
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</body>
</html>
