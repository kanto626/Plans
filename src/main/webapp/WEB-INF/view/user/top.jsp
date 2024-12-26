<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>トップページ</title>
</head>
<body>
	<h1>旅行プラン投稿サイト</h1>
	<%-- ユーザーがログインしているかどうかをチェック --%>
	<%
	// セッションからユーザー情報を取得
	User user = (User) session.getAttribute("user");
	if (user != null) {
	%>
	<!-- ログイン状態の場合 -->
	<p>
		ようこそ、<%=user.getUsername()%>さん
	</p>
	<p>
		<a href="<%=request.getContextPath()%>/user/mypage">マイページ</a>
	</p>
	<p>
		<a href="<%=request.getContextPath()%>/user/searchPlan">旅行プラン検索</a>
	</p>
	<p>
		<a href="<%=request.getContextPath()%>/user/addPlan">旅行プラン作成</a>
	</p>
	<p>
		<a href="<%=request.getContextPath()%>/user/logout">ログアウト</a>
	</p>

	<%
	} else {
	%>
	<!-- ログインしていない場合 -->
	<p>
		<a href="<%=request.getContextPath()%>/user/login">ログイン</a>
	</p>
	<p>
		<a href="<%=request.getContextPath()%>/user/register">アカウント作成</a>
	</p>
	<%
	}
	%>
</body>
</html>