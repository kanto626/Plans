
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
	<h2>ユーザーリスト</h2>
	<table border="1">
		<tr>
			<th>管理番号</th>
			<th>名前</th>
		</tr>
		<c:forEach items="${userList}" var="user">
			<tr>
				<td><c:out value="${user.id}" /></td>
				<td><a href="userShow?id=${user.id}"><c:out
							value="${user.name}" /></a></td>
			</tr>
		</c:forEach>
	</table>
	<p>
		<a href="<%=request.getContextPath()%>/admin/logout">ログアウト</a>
	</p>
</body>
</html>
