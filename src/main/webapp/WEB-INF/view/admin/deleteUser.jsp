<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>deleteUser</title>
</head>
<body>
	<h1>会員削除</h1>
	<form action="" method="post">
		<table border="1">
			<tr>
				<th>管理番号</th>
				<td><c:out value="${user.id}" /></td>
			</tr>
			<tr>
				<th>名前</th>
				<td><c:out value="${user.name}" /></td>
			</tr>
			<tr>
				<th>ID</th>
				<td><c:out value="${user.login_id}" /></td>
			</tr>
		</table>
		<p>
			<input type="submit" value="削除">
		</p>
	</form>
	<a href="<%=request.getContextPath()%>/admin/users">ユーザーリストに戻る</a>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script>
		$(document).ready(function() {
			$("form").submit(function() {
				return confirm("本当に削除しますか？");
			});
		});
	</script>
</body>
</html>
