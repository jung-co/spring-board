<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
</head>
<body>

<div id="nav">
	<%@ include file="../include/nav.jsp" %>
</div>

<label>제목</label>
${view.title}<br />
<hr style="boarder:solid 20px black;">

<label>작성자</label>
${view.writer}<br />
<hr style="boarder:solid 20px black;">

<label>내용</label>
${view.content}<br />
<hr style="boarder:solid 20px black;"/>

<div>
	<a href="/board/modify?bno=${view.bno}">게시물 수정</a> <a href="/board/delete?bno=${view.bno}">게시물 삭제</a>
</div>
<hr style="boarder:solid 20px black;"/>

<!-- 댓글 시작 -->
<c:forEach items="${reply}" var="reply">
	<li>
		<div>
			<p>${reply.writer} (<fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd" />)</p>
			<p>${reply.content}</p>
			<p><a href="/board/replyModify?bno=${view.bno}">댓글 수정</a></p>
		</div>
	</li>	
</c:forEach>
<div>

	<form method="post" action="/reply/write">
		<p>
			<label>댓글 작성자</label> <input type="text" name="writer">
		</p>
		<p>
			<textarea rows="5" cols="50" name="content"></textarea>
		</p>
		<p>
			<input type="hidden" name="bno" value="${view.bno}">
			<button type="submit">댓글 작성</button>
		</p>
	</form>
</div>

<!-- 댓글 끝 -->
</body>
</html>