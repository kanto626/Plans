<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>マイプランリスト</title>
</head>
<body>
	<h1>マイプランリスト</h1>

	<c:if test="${not empty user.name}">
		<h2>${user.name}さんの旅行プランリスト</h2>
	</c:if>

	<!-- 旅行プランの一覧を表示 -->
	<table border="1" cellspacing="0">
		<tr>
			<th>タイトル</th>
		</tr>
		<c:forEach items="${plans}" var="p">
			<tr>
				<td><a href="planShow?id=<c:out value="${p.id}" />"> <c:out
							value="${p.title}" /></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
