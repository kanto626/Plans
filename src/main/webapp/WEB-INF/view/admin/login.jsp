<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ログイン</title>
</head>
<body>
	<h1>ログイン</h1>
	<c:if test="${not empty error}">
		<p>アカウントが見つかりませんでした。ログインID 又はパスワードを確認してください。</p>
	</c:if>
	<form action="" method="post">
		<p>
			<input type="text" name="adminId" placeholder="ログインID">
		</p>
		<p>
			<input type="password" name="adminPass" placeholder="パスワード">
		</p>
		<p>
			<input type="submit" value="ログイン">
		</p>
	</form>
</body>
</html>