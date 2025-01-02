<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ユーザーログイン</title>
</head>
<body>
	<h1>ユーザーログイン</h1>
	<c:if test="${not empty error}">
		<p>アカウントが見つかりませんでした。ログインID 又はパスワードを確認してください。</p>
		<p>
			まだアカウントを作成していない場合は<a href="${pageContext.request.contextPath}/user/register">コチラ</a>から作成してください
		</p>
	</c:if>
	<form action="" method="post">
		<p>
			<input type="text" name="loginId" placeholder="ログインID">
		</p>
		<p>
			<input type="password" name="loginPass" placeholder="パスワード">
		</p>
		<p>
			<input type="submit" value="ログイン">
		</p>
	</form>
</body>
</html>