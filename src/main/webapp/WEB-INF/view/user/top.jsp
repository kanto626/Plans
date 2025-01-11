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
	<noscript>
  <div class="alert alert-warning " role="alert">
    このサイトの全機能を利用するには、JavaScriptを有効にしてください。
  </div>
</noscript>
	<div
		class="container-fluid vh-100 d-flex justify-content-center align-items-center">
		<%
		String loginId = (String) session.getAttribute("loginId");
		if (loginId != null) {
		%>


		<!-- ログイン中の表示 -->
		<div class="container">
			<div class="container-fluid vh-100 d-flex">
				<!-- 左側: 中央に縦並び -->
				<div
					class="col-5 d-flex flex-column justify-content-center align-items-center">
					<h1 class="display-1_5x fw-light">Plans</h1>
					<p class="h4 fw-medium mb-4">― 旅行プラン投稿サイト ―</p>
					<p>
						<a href="<%=request.getContextPath()%>/user/logout"><button
								type="button" class="btn btn-outline-secondary btn-sm">ログアウト</button></a>
					</p>
				</div>
				<!-- 右側: 縦並び -->
				<div
					class="col-6 offset-2 d-flex flex-column justify-content-center align-items-center">
					<ul class="list-unstyled display-6">
						<li class="mb-5"><a
							href="<%=request.getContextPath()%>/user/selectPrefecture"
							class="custom-link">旅行プラン検索トップ</a></li>
						<li class="mb-5"><a
							href="<%=request.getContextPath()%>/user/addPlan"
							class="custom-link">旅行プラン作成</a></li>
						<li class="mb-5"><a
							href="<%=request.getContextPath()%>/user/myPage"
							class="custom-link">マイページ</a></li>
					</ul>
				</div>
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
