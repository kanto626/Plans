
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>アカウント一覧</title>
</head>
<body>
	<h1>会員一覧</h1>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>名前</th>
		</tr>
		<c:forEach items="${userList}" var="user">
			<tr>
				<td><c:out value="${user.id}" /></td>
				<td><c:out value="${user.name}" /></td>
			</tr>
		</c:forEach>
	</table>
	<p>
		<a href="<%=request.getContextPath()%>/admin/logout">ログアウト</a>
	</p>
</body>
</html>
