<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>旅行プラン投稿完了</title>
</head>
<body>
	<h1>旅行プラン投稿完了</h1>
	<p>旅行プランが正常に登録されました。</p>

	<h2>登録内容</h2>
	<table border="1" cellpadding="10">
		<tr>
			<th>登録者</th>
			<td><c:out value="${plan.user.name}" /></td>
		</tr>
		<tr>
			<th>登録日</th>
			<td>
			<fmt:formatDate value="${plan.registeredAt}" pattern="y/M/d" />
			</td>
		</tr>
		<tr>
			<th>タイトル</th>
			<td><c:out value="${plan.title}" /></td>
		</tr>
		<tr>
			<th>目的地</th>
			<td><c:out value="${plan.place}" /></td>
		</tr>
		<tr>
			<th>目的</th>
			<td><c:out value="${plan.category}" /></td>
		</tr>
		<tr>
			<th>スケジュール</th>
			<td><c:out value="${plan.detail}" /></td>
		</tr>
	</table>
	<p>
		<a href="<%=request.getContextPath()%>/user/addPlan">旅行プラン作成に戻る </a>
	</p>
	<p>
		<a href="<%=request.getContextPath()%>/user/top">トップに戻る </a>
	</p>
</body>
</body>
</html>
