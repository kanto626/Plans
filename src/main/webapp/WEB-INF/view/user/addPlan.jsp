<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>旅行プラン投稿</title>
<style>
.error {
	color: #f00;
}
</style>
</head>
<body>
	<h1>旅行プラン投稿</h1>
	<form action="" method="post">
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th>タイトル</th>
				<td><c:if test="${!empty errorTitle}">
						<p class="error">
							<c:out value="${errorTitle}" />
						</p>
					</c:if> <input type="text" name="title" value="<c:out value="${title}" />"></td>
			</tr>
			<tr>
				<th>場所</th>
				<td><c:if test="${!empty errorPlace}">
						<p class="error">
							<c:out value="${errorPlace}" />
						</p>
					</c:if> <input type="text" name="place" value="<c:out value="${place}" />"></td>
			</tr>
			<tr>
				<th>詳細</th>
				<td><textarea name="description" rows="5" cols="30"><c:out
							value="${description}" /></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="登録"></td>
			</tr>
		</table>
	</form>
</body>
</html>
