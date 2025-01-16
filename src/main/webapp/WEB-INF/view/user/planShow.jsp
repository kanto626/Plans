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
		<li>登録日: <c:out value="${plan.registeredAt}" /></li>
		<li>場所: <c:out value="${plan.place}" /></li>
		<li>目的: <c:out value="${plan.category}" /></li>
		<li>スケジュール: <c:out value="${plan.schedule}" /></li>
	</ul>
	<!-- 削除ボタン表示の条件 -->
	<c:if test="${plan.user.id == sessionScope.user.id}">
		<!-- 削除リンク -->
		<a href="deletePlan?id=<c:out value="${plan.id}" />">削除</a>
	</c:if>
	<a href="${not empty sessionScope.previousPage ? sessionScope.previousPage : '/defaultPage'}">戻る</a>
</body>
</html>