
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>管理者専用</title>
</head>
<body>
	<h1>管理者専用</h1>
	<h2>会員一覧</h2>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>名前</th>
		</tr>
		<c:forEach items="${userList}" var="user">
			<tr>
				<td><c:out value="${user.id}" /></td>
				<td><a href="userShow?id=<c:out value="${user.name}" />"><c:out
							value="${user.name}" /></td>
			</tr>
		</c:forEach>
	</table>
	<p>
		<a href="<%=request.getContextPath()%>/admin/logout">ログアウト</a>
	</p>
</body>
</html>
