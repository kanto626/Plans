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

		<div class="container mt-5">
			<p>以下の内容で登録しました</p>
			<!-- 基本情報 -->
			<div class="container">
				<strong>投稿者 : </strong> ${plan.user.name} <strong>投稿日 :
					</strong> <fmt:formatDate value="${plan.registeredAt}" pattern="yyyy-MM-dd" />
			</div>
			<div class="container">
				<strong>タイトル : </strong>${plan.title}
			</div>
			<div class="container">
				<strong>場所 : </strong>${plan.place}
			</div>
			<div class="container">
				<strong>カテゴリ : </strong>${plan.category}
			</div>
			<div id="scheduleContainer">
				<h3>- スケジュール -</h3>
				<!-- スポットとその情報を表示 -->
				<div class="d-flex flex-column mt-3">
					<c:forEach var="scheduleItem" items="${scheduleList}">
						<div class="schedule-item d-flex flex-row align-items-start mb-4">
							<!-- 左側にスポット名とコメントを表示 -->
							<div class="d-flex flex-column w-75">
								<!-- スポット名 -->
								<c:if test="${not empty scheduleItem['スポット名']}">
									<p>
										<strong>スポット名:</strong> ${scheduleItem['スポット名']}
									</p>
								</c:if>
								<!-- コメント -->
								<c:if test="${not empty scheduleItem['コメント']}">
                                    ${scheduleItem['コメント']}
                                </c:if>
							</div>
							<!-- 右側に写真と移動手段、所要時間を表示 -->
							<div class="d-flex flex-column">
								<!-- 写真 -->
								<c:if test="${not empty scheduleItem['写真']}">
									<p>
										<img
											src="${pageContext.request.contextPath}${scheduleItem['写真']}"/ >
									</p>
								</c:if>
							</div>
						</div>
						<!-- 次のスポットまでの所要時間(アイコンと所要時間) -->
						<div class="d-flex justify-content-center">

							<div class="display-5 d-flex flex-column me-0">
								<i class="bi bi-caret-down"></i> <i class="bi bi-caret-down"></i>
								<i class="bi bi-caret-down"></i>
							</div>

							<div>
								<!-- 所要時間のフォーム -->

								<span>次のスポットまでの所要時間</span>
								<div class="d-flex align-items-center gap-3 ms-0">
									<c:if test="${not empty scheduleItem['所要時間']}">
										<p>
											<strong> <c:if
													test="${not empty scheduleItem['移動手段']}">
                                                    ${scheduleItem['移動手段']}
                                                </c:if>:約
											</strong> ${scheduleItem['所要時間']}
										</p>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<a href="<%=request.getContextPath()%>/user/addPlan">別の旅行プランを投稿</a> <a
				href="<%=request.getContextPath()%>/user/myPlans">マイプランリスト</a>
		</div>
		<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</html>
