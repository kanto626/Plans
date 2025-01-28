<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>addPlanDone</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<style>
div {
	border: 1px solid #000;
	/* 境界線のスタイル */
	margin: 1rem;
	/* すべての方向に余白を追加 */
	padding: 1rem;
	/* 境界線の内側に余白を追加 */
}

body {
	text-align: center;
	background-color: #EEEEEE;
}

img {
	width: 300px;
	height: 200px;
}
</style>
</head>
<body>
	<div
		class="container d-flex flex-column justify-content-center align-items-center vh-100">
		<div class="alert alert-secondary" role="alert">
			<h1>旅行プランが正常に登録されました</h1>
		</div>
		<div class="d-flex justify-content-center gap-3">
			<a href="<%=request.getContextPath()%>/user/myPlans"
				class="btn btn-secondary d-flex align-items-center justify-content-center">
				<h4 class="m-0">マイプランリスト</h4>
			</a> <a href="<%=request.getContextPath()%>/user/addPlan"
				class="btn btn-primary d-flex align-items-center justify-content-center">
				<h4 class="m-0">別の旅行プランを投稿</h4>
			</a>
		</div>


	</div>


	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</html>
