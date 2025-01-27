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
	background-color: #f9f9f9;
}

img {
	width: 300px;
	height: 200px;
}
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="alert alert-success text-center" role="alert">
			<h2>旅行プランが正常に登録されました！</h2>
		</div>

		
			</div>

			<a href="<%=request.getContextPath()%>/user/addPlan">別の旅行プランを投稿</a> <a
				href="<%=request.getContextPath()%>/user/myPlans">マイプランリスト</a>
		</div>
		<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</html>
