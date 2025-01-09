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
	<%-- ユーザーがログインしているかどうかをチェック --%>
	<%
	// セッションからログインIDを取得
	String loginId = (String) session.getAttribute("loginId");
	if (loginId != null) {
	%>


	<!-- ログイン状態の場合 -->
	<h1>Plans</h1>
	<h2>旅行プラン投稿サイト</h2>
	<p>
		<a href="<%=request.getContextPath()%>/user/selectPrefecture">旅行プラン検索トップ</a>
	</p>
	<p>
		<a href="<%=request.getContextPath()%>/user/addPlan">旅行プラン作成</a>
	</p>
	<p>
		<a href="<%=request.getContextPath()%>/user/myPage">マイページ</a>
	</p>
	<p>
		<a href="<%=request.getContextPath()%>/user/logout">ログアウト</a>
	</p>


	<%
	} else {
	%>

	<!-- ログインしていない場合 -->
	<h1>Plans</h1>
	<h2>旅行プラン投稿サイト</h2>
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