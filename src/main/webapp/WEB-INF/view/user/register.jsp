<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>register</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<head>
<body class="bg-light text-center">
	<div class="container text-center">
		<div class="row justify-content-center">
			<form action="" method="post"
				class="border rounded bg-white col-md-6 p-4">
				<h2 class="mt-3 mb-5">アカウント登録</h2>

				<div class="mb-3">
					<input type="text" name="name"
						class="form-control rounded-pill w-75 m-auto" placeholder="ユーザー名"
						value="<c:out value='${name}'/>">
					<c:if test="${not empty nameError}">
						<p class="text-danger small mt-2 w-75 m-auto">

							<style>
input[name="name"] {
	background-color: #f8d7da;
}
</style>
							<c:out value="${nameError}" />
						</p>
					</c:if>
				</div>

				<div class="mb-3">
					<input type="text" name="loginId"
						class="form-control rounded-pill w-75 m-auto"
						placeholder="ログインID (5～30字以内)" value="<c:out value='${loginId}'/>">
					<c:if test="${not empty loginIdError}">
						<p class="text-danger small mt-2 w-75 m-auto">

							<style>
input[name="loginId"] {
	background-color: #f8d7da;
}
</style>
							<c:out value="${loginIdError}" />
						</p>
					</c:if>
				</div>

				<div class="mb-3">
					<input type="password" name="loginPass"
						class="form-control rounded-pill w-75 m-auto"
						placeholder="パスワード (4文字以上)">
					<c:if test="${not empty loginPassError}">
						<p class="text-danger small mt-2 w-75 m-auto">
							<style>
input[name="loginPass"] {
	background-color: #f8d7da;
}
</style>
							<c:out value="${loginPassError}" />
						</p>
					</c:if>
				</div>


				<button type="submit" class="btn btn-primary rounded-pill my-4 px-5">作成する</button>
			</form>
				<a href="<%=request.getContextPath()%>/user/top">トップに戻る</a>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</html>