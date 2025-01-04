<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>旅行プラン一覧</title>
</head>
<body>
	<h1>旅行プラン一覧</h1>
	<table border="1" cellspacing="0">
		<tr>
			<th>ID</th>
			<th>タイトル</th>
			<th>投稿者</th>
		</tr>
		<c:forEach items="${plans}" var="p">
			<tr>
				<td><c:out value="${p.id}" /></td>
				<td><a href="planShow?id=<c:out value="${p.id}" />"> <c:out
							value="${p.title}" /></td>
				</a>
				<td><c:out value="${p.user.name}" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>

</body>
</html>