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

	<!-- 都道府県が選択されていれば表示 -->
	<c:if test="${not empty selectedPrefecture}">
		<h2>${selectedPrefecture}の旅行プラン</h2>
	</c:if>

	<!-- 旅行プランの一覧を表示 -->
	<table border="1" cellspacing="0">
		<tr>
			<th>タイトル</th>
			<th>投稿者</th>
		</tr>
		<c:forEach items="${plans}" var="p">
			<tr>
				<td><a href="planShow?id=<c:out value="${p.id}" />"> <c:out
							value="${p.title}" /></a></td>
				<td><c:out value="${p.user.name}" /></td>
			</tr>
		</c:forEach>
	</table>
	<a href="${sessionScope.previousPage}">前のページに戻る</a>
</body>
</html>
