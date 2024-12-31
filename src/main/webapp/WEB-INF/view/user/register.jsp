<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>アカウント作成</title>
</head>
<body>
	<h1>アカウント作成</h1>
	<form action="" method="post">
		<p>
			ユーザー名: <input type="text" name="name" placeholder="ユーザー名"
				value="<c:out value="${name}" />">
		</p>
		<c:if test="${not empty nameError}">
			<p style="color: red;">
				※
				<c:out value="${nameError}" />
			</p>
		</c:if>
		<p>
			ログインID: <input type="text" name="loginId" placeholder="30字以内"
				value="<c:out value="${loginId}" />">
		</p>
		<c:if test="${not empty loginIdError}">
			<p style="color: red;">
				※
				<c:out value="${loginIdError}" />
			</p>
		</c:if>
		<p>
			パスワード: <input type="password" name="loginPass" placeholder="4文字以上">
		</p>
		<c:if test="${not empty loginPassError}">
			<p style="color: red;">
				※
				<c:out value="${loginPassError}" />
			</p>
		</c:if>
		<p>
			<input type="submit" value="作成する">
		</p>
	</form>
</body>
</html>