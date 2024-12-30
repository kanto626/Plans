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
		<p>ユーザー名:
			<input type="text" name="name" placeholder="ユーザー名">
		</p>
		<p>ログインID:
			<input type="text" name="loginId" placeholder="ログインID">
		</p>
		<p>パスワード:
			<input type="password" name="loginPass" placeholder="パスワード">
		</p>
		<p>
			<input type="submit" value="作成する">
		</p>
	</form>
</body>
</html>