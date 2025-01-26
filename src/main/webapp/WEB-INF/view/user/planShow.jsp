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
		<h1>旅行プラン詳細</h1>
		<p>
			<c:if test="${plan.user.id == sessionScope.user.id}">
				<!-- 更新リンク -->
				<a href="editPlan?id=<c:out value="${plan.id}" />">編集</a>
			</c:if>
		</p>
		<div class="container mt-5">

			<!-- 基本情報 -->
			<div class="container">
				<strong>投稿者 : </strong> ${plan.user.name} <strong>投稿日 : </strong>
				<fmt:formatDate value="${plan.registeredAt}" pattern="yyyy-MM-dd" />
			</div>
			<div class="container">
				<strong>タイトル : </strong>${plan.title}
			</div>
			<div class="container">
				<strong>場所 : </strong>${plan.place}

			</div>
			<!-- スケジュール表示 -->
			<div id="scheduleContainer">
				<c:forEach var="schedule" items="${scheduleList}">
					<div class="schedule-item mb-3"
						style="border: 1px solid #ccc; padding: 1rem;">

						<!-- スポット名/コメント/画像 -->
						<div class="d-flex flex-row align-items-start mt-3">
							<div class="d-flex flex-column w-75">

								<p class="form-control">${schedule['スポット名']}</p>


								<p class="form-control">${schedule['コメント']}</p>
							</div>
							<div class="photo-section ms-3">

								<c:if test="${not empty schedule['写真']}">
									<img src="${pageContext.request.contextPath}${schedule['写真']}"
										alt="スポット画像" style="max-width: 300px;">
								</c:if>
								<c:if test="${empty schedule['写真']}">
									<p>画像はありません。</p>
								</c:if>
							</div>
						</div>

						<!-- 移動手段 + 所要時間 -->
						<c:if
							test="${not empty schedule['移動手段'] or not empty schedule['所要時間']}">
							<div
								class="d-flex justify-content-center align-items-center mt-3">
								<div class="display-5 d-flex flex-column me-0">
									<i class="bi bi-caret-down"></i> <i class="bi bi-caret-down"></i>
									<i class="bi bi-caret-down"></i>
								</div>
								<div>
 <span>次のスポットまでの所要時間</span>
									<div class="d-flex align-items-center gap-3 ms-0">
								
										<p class="form-control mb-0">${schedule['移動手段']}</p>

										<p class="form-control mb-0">${schedule['所要時間']}</p>
									</div>
								</div>
							</div>
						</c:if>
					</div>
				</c:forEach>
			</div>

			<!-- 削除ボタン表示の条件 -->
			<c:if test="${plan.user.id == sessionScope.user.id}">
				<!-- 削除リンク -->
				<a href="deletePlan?id=<c:out value="${plan.id}" />">削除</a>
			</c:if>
		</div>
		<a
			href="${not empty sessionScope.previousPage ? sessionScope.previousPage : '/defaultPage'}">戻る</a>
	</div>
	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</html>