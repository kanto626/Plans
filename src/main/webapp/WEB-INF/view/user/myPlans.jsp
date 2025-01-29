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
.table-dark {
	background-color: #222; /* テーブル背景を黒に */
	color: #fff; /* テキストを白に */
}

.table-dark a {
	color: #ffc107; /* リンクはゴールドカラー */
}

.table-dark a:hover {
	color: #fff; /* ホバーで白に変更 */
}

.flash-message {
	color: #28a745; /* グリーン */
	font-weight: bold;
	text-align: center;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<div class="container my-5">


		<!-- ユーザー名 -->
		<c:if test="${not empty user.name}">
			<h2 class="text-center text-secondary">${user.name}さんの旅行プランリスト</h2>
		</c:if>

		<!-- フラッシュメッセージ -->
		<c:if test="${not empty sessionScope.flashMessage}">
			<div class="flash-message">${sessionScope.flashMessage}</div>
			<c:set var="flashMessage" scope="session" value="" />
		</c:if>

		<!-- 旅行プランリスト -->
		<div class="card">
			<div class="card-header">
				<h4 class="mb-0">タイトル</h3>
			</div>
			<div class="card-body p-0">
				<table class="table table-striped table-hover m-0">


					<tbody>
						<c:forEach items="${plans}" var="p">
							<tr>
								<td><a href="planShow?id=<c:out value='${p.id}' />"> <c:out
											value="「${p.title}」" />
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<!-- ホームへのリンク -->
		<div class="text-center mt-4">
			<a href="<%=request.getContextPath()%>/user/home"
				class="btn btn-secondary">ホーム</a>
		</div>
	</div>

	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</html>
