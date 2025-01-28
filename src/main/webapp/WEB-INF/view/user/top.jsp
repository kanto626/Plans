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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
div {
	border: 2px solid #000;
	/* 境界線のスタイル */
	padding: 2rem;
	/* 上下左右の均等な余白 */
	margin: 2rem;
	/* 外側の均等な余白 */
}

.scale-container {
	transform: scale(0.5);
	/* 50%のサイズに縮小 */
	transform-origin: center;
	/* 縮小の基準を中央に設定 */
	border-width: 3px;
	/* 線の幅を3pxに設定 */
}

h3, .text-center {
	white-space: nowrap;
	/* テキストが折り返されないように設定 */
}

.square-container {
	width: 100%;
	/* 幅を100%に設定（親要素に基づく） */
	padding-top: 100%;
	/* 高さを幅と同じに設定 */
	position: relative;
	/* 親要素として相対的な位置を指定 */
}

.square-container .content {
	position: absolute;
	/* コンテンツを相対的に配置 */
	top: 50%;
	/* 垂直方向に中央揃え */
	left: 50%;
	/* 水平方向に中央揃え */
	transform: translate(-50%, -50%);
	/* 正確に中央に配置 */
}

.square-container {
	width: 300px;
	/* 幅を300pxに設定 */
	height: 300px;
	/* 高さも300pxに設定 */
	background-color: rgb(168, 164, 164);
	/* 背景色を設定（任意） */
	border: 3px solid black;
}

.d-flex {
	margin-top: -30px; /* ボタンを少し上に移動 */
}
</style>
</head>

<body>
	<noscript>
		<div class="alert alert-warning " role="alert">
			このサイトの全機能を利用するには、JavaScriptを有効にしてください。</div>
	</noscript>
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
							href="<%=request.getContextPath()%>/user/myPlans"
							class="custom-link">マイプランリスト</a></li>
					</ul>
				</div>
			</div>
		</div>


		<%
		} else {
		%>



		<!-- 未ログイン時の表示 -->
		<div
			class="container-fluid vh-100 d-flex justify-content-center align-items-center scale-container border-0">
			<div class="square-container text-center py-2">
				<div class="pt-5">
					<h1 class="display-2x fw-light mt-3">Plans</h1>
				</div>
				<h1 class="display-3">― 旅行プラン投稿サイト ―</h1>
			</div>
			<!-- ログインとアカウント作成を横並び -->
			<div class="d-flex justify-content-center gap-4 pt-3 mb-5 border-0">
				<a href="<%=request.getContextPath()%>/user/login"><button
						type="button" class="btn btn-outline-secondary">
						<h3 class="mx-5 mt-2"
							style="font-weight: bold; font-size: 1.5rem; letter-spacing: 0.05em;">
							ログイン<span class="bi bi-door-open"></span>
						</h3>
					</button></a> <a href="<%=request.getContextPath()%>/user/register"><button
						type="button" class="btn btn-outline-secondary">
						<h3 class="mx-5 mt-2"
							style="font-weight: bold; font-size: 1.5rem; letter-spacing: 0.05em;">アカウント作成</h3>
					</button></a>
			</div>
		</div>
		<%
		}
		%>


	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>

</html>
