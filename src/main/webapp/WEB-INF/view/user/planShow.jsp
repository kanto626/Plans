<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>旅行プラン詳細</title>
</head>
<body>
	<h1>
		<c:out value="${plan.title}" />
	</h1>
	<ul>
		<li>投稿者: <c:out value="${plan.user.name}" /></li>
		<li>場所: <c:out value="${plan.place}" /></li>
		<li>目的: <c:out value="${plan.category}" /></li>
		<li>スケジュール: <c:out value="${plan.detail}" /></li>
	</ul>
	<a href="plans">旅行プラン一覧に戻る</a>

</body>
</html>