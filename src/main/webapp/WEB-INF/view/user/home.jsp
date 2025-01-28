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
.custom-container {
	/* 境界線のスタイル */
	margin: 1rem;
	/* すべての方向に余白を追加 */
	padding: 1rem;
	/* 境界線の内側に余白を追加 */
}

/* 共通のリンクスタイルを定義 */
.custom-link {
	color: #453539;
	/* デフォルトリンクカラー */
	text-decoration: underline;
	text-underline-offset: 15px;
	text-decoration-color: rgba(231, 219, 236, 0.25);
	transition: text-decoration-color 0.3s;
}

.custom-link:hover {
	color: #4a4842a1;
	/* ホバー時にリンクの色を変更 */
	text-decoration-color: rgba(3, 58, 113, 0.25);
	/* ホバー時に下線の色を変更 */
}
</style>
</style>
</head>

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
<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>

</html>