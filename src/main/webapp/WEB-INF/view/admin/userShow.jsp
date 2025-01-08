<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ユーザー情報</title>
</head>
<body>
	<h1>ユーザー情報</h1>
	<p>ID: ${plans[0].user.id}</p>
	<p>ユーザー名: ${plans[0].user.name}</p>

	<h2>旅行プラン</h2>
	<!-- 旅行プランの一覧を表示 -->
	<table border="1" cellspacing="0">
		<tr>
			<th>タイトル</th>
		</tr>
		<c:forEach items="${plans}" var="p">
			<tr>
				<td><a href="<%=request.getContextPath()%>/user/planShow?id=<c:out value="${p.id}" />"> <c:out
							value="${p.title}" /></a></td>
			</tr>
		</c:forEach>
	</table>
	<a href="<%=request.getContextPath()%>/admin/users">ユーザーリストに戻る</a>
</body>
</html>