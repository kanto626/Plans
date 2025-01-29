<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>planShow</title>
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


img {
	width: 300px;
	height: 200px;
}
</style>
</head>
<body>
	<form action="" method="post">
		<div class="container mt-5 border-0">
			<h2>以下のプランを削除します</h2>

			<input type="submit" value="削除">

			<div class="container mt-5">

				<!-- 基本情報 -->
				<div class="container"
					style="border: 1px solid #ccc; padding: 1rem;">
					<strong>投稿者 : </strong> ${plan.user.name} <strong>投稿日 : </strong>
					<fmt:formatDate value="${plan.registeredAt}" pattern="yyyy-MM-dd" />
				</div>
				<div class="container"
					style="border: 1px solid #ccc; padding: 1rem;">
					<strong>タイトル : </strong>${plan.title}
				</div>
				<div class="container"
					style="border: 1px solid #ccc; padding: 1rem;">
					<strong>場所 : </strong>${plan.place}

				</div>

			</div>
	</form>
	<a href="<%=request.getContextPath()%>/user/myPlans">マイプランリストに戻る</a>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script>
		$(document).ready(function() {
			$("form").submit(function() {
				return confirm("本当に削除しますか？");
			});
		});
	</script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</html>