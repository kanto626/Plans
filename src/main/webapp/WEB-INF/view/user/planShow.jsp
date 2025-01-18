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
	border: 1px solid #000; /* 境界線のスタイル */
}
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="card">
			<div class="card-header">
				<h4>プラン内容</h4>
			</div>
			<div class="card-body">
				<p>
					<strong>タイトル：</strong>${plan.title}</p>
				<p>
					<strong>場所：</strong>${plan.place}</p>
				<p>
					<strong>カテゴリ：</strong>${plan.category}</p>

				<h5 class="mt-4">スケジュール</h5>
				<div class="schedule">
					<c:forEach var="scheduleItem" items="${scheduleList}">
						<div class="schedule-item">
							<c:if test="${not empty scheduleItem['スポット名']}">
								<p>
									<strong>スポット名:</strong> ${scheduleItem['スポット名']}
								</p>
							</c:if>
							<c:if test="${not empty scheduleItem['コメント']}">
								<p>
									<strong>コメント:</strong> ${scheduleItem['コメント']}
								</p>
							</c:if>
							<c:if test="${not empty scheduleItem['写真']}">
								<p>
									<strong>写真:</strong> ${scheduleItem['写真']}
								</p>
							</c:if>
							<c:if test="${not empty scheduleItem['移動手段']}">
								<p>
									<strong>移動手段:</strong> ${scheduleItem['移動手段']}
								</p>
							</c:if>
							<c:if test="${not empty scheduleItem['所要時間']}">
								<p>
									<strong>所要時間:</strong> ${scheduleItem['所要時間']}
								</p>
							</c:if>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="mt-4 text-center">
	<!-- 削除ボタン表示の条件 -->
	<c:if test="${plan.user.id == sessionScope.user.id}">
		<!-- 削除リンク -->
		<a href="deletePlan?id=<c:out value="${plan.id}" />">削除</a>
	</c:if>
	<a href="${not empty sessionScope.previousPage ? sessionScope.previousPage : '/defaultPage'}">戻る</a>		
	</div>
	</div>
	
</body>
</html>