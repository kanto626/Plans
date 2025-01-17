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
	border: 1px solid #000; /* 境界線のスタイル */
}
</style>
</head>
<body>
	<div class="container">

		<div class="alert alert-success" role="alert">
			<h4 class="alert-heading">以下の内容で投稿しました。</h4>

		</div>

		<div class="container">

			<div class="mb-3">
				<p>
					<strong>登録者:</strong>
					<c:out value="${plan.user.name}" />
				</p>
				<p>
					<strong>登録日:</strong>
					<fmt:formatDate value="${plan.registeredAt}" pattern="y/M/d" />
				</p>
				<p>
					<strong>タイトル:</strong> ${plan.title}
				</p>
				<p>
					<strong>目的地:</strong> ${plan.place}
				</p>
				<p>
					<strong>カテゴリ:</strong> ${plan.category}
				</p>
				<div class="schedule-container">
					<h3 class="mt-4">- スケジュール -</h3>


					<!-- スケジュールデータを取得 -->
					<c:if test="${not empty scheduleText}">
						<c:forEach var="scheduleList" items="${scheduleList}">
							<!-- 1行ずつ処理 -->
							<c:set var="fields" value="${fn:split(scheduleLine, ' //| ')}" />

							<div class="d-flex flex-row align-items-start mt-3">
								<!-- スポット、コメントエリア、スポット間アイコンを縦に並べる -->
								<div class="d-flex flex-column w-75">
									<!-- スポット名 -->
									<p>スポット名: <c:out value="${fields[0]}" /></p>

									<!-- コメントエリア -->
									 <p>コメント: <c:out value="${fields[1]}" /></p>
									<!-- スポット間のアイコンと選択項目 -->
									<div class="d-flex align-items-center">
										<div class="display-6 d-flex flex-column me-3">
											<i class="bi bi-caret-down"></i> <i class="bi bi-caret-down"></i>
											<i class="bi bi-caret-down"></i>
										</div>
										<div class="container">
											<p>移動手段と所要時間</p>
											<div class="d-flex align-items-center gap-2">
												<!-- Transport Selection -->
												 <p>移動手段: <c:out value="${fields[3]}" /></p>
												<<p>所要時間: <c:out value="${fields[4]}" /></p>
											</div>
										</div>
									</div>
									<!-- 画像 -->
									 <p>写真: <c:out value="${fields[2]}" /></p>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>

		</div>

		<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
