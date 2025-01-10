<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<title>トップページ</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet">
</head>

<body>
	<div
		class="container-fluid vh-100 d-flex justify-content-center align-items-center">
		<%
		String loginId = (String) session.getAttribute("loginId");
		if (loginId != null) {
		%>
		<!-- ログイン中の表示 -->
		<div class="row w-100 text-center">
			<div
				class="col-md-6 d-flex flex-column justify-content-center align-items-center">
				<h1>Plans</h1>
				<h2>旅行プラン投稿サイト</h2>
				<a href="<%=request.getContextPath()%>/user/logout">ログアウト</a>
			</div>
			<div
				class="col-md-6 d-flex flex-column justify-content-center align-items-center">
				<ul class="list-unstyled">
					<li><a
						href="<%=request.getContextPath()%>/user/selectPrefecture">旅行プラン検索トップ</a></li>
					<li><a href="<%=request.getContextPath()%>/user/addPlan">旅行プラン作成</a></li>
					<li><a href="<%=request.getContextPath()%>/user/myPage">マイページ</a></li>
				</ul>
			</div>
		</div>
		<%
		} else {
		%>
		<!-- 未ログイン時の表示 -->
		<div class="text-center">
			<h1 class="display-4 fw-light">Plans</h1>
			<p class="h4 fw-medium">― 旅行プラン投稿サイト ―</p>
			<div class="d-flex justify-content-center gap-4 mb-3 py-2">
				<a href="<%=request.getContextPath()%>/user/login">
					<button type="button" class="btn btn-outline-secondary">ログイン</button>
				</a> <a href="<%=request.getContextPath()%>/user/register">
					<button type="button" class="btn btn-outline-secondary">アカウント作成</button>
				</a>
			</div>
		</div>
		<%
		}
		%>
	</div>
	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>

</html>
