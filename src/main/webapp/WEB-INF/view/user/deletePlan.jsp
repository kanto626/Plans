<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>旅行プラン削除</title>
</head>
<body>
	<h1>以下のプランを削除</h1>
	<form action="" method="post">
		<table border="1">
			<tr>
				<th>投稿者</th>
				<td><c:out value="${plan.user.name}" /></td>
			</tr>
			<tr>
				<th>スケジュール</th>
				<td><c:out value="${plan.detail}" /></td>
			</tr>
			<tr>
				<th>場所</th>
				<td><c:out value="${plan.place}" /></td>
			</tr>
			<tr>
				<th>目的</th>
				<td><c:out value="${plan.category}" /></td>
			</tr>
			<tr>
				<th>登録日</th>
				<td><c:out value="${plan.registeredAt}" /></td>
			</tr>
		</table>
		<p>
			<input type="submit" value="削除">
		</p>
	</form>
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