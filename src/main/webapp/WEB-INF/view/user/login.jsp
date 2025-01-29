<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>PlansLogin</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet">

</head>

<body>

	<h1 class="my-5">Plans</h1>
	<div class="container text-center">
		<div class="row justify-content-center">
			<form action="" method="post"
				class="border rounded bg-white col-md-4 p-3">
				<h2 class="mt-3 mb-5">Login</h2>

				<c:if test="${not empty error}">
					<p>アカウントが見つかりませんでした。ログインID 又はパスワードを確認してください。</p>
					<p>
						まだアカウントを作成していない場合は<a
							href="${pageContext.request.contextPath}/user/register">コチラ</a>から作成してください
					</p>
				</c:if>

				<div class="mb-3">
					<input type="text" name="loginId"
						class="form-control rounded-pill w-75 m-auto" placeholder="ログインID"
						value="<c:out value='${loginId}'/>">
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
						class="form-control rounded-pill w-75 m-auto" placeholder="パスワード">
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
				<button type="submit" class="btn btn-primary rounded-pill my-4 px-5">ログイン</button>
			</form>
		</div>
				<h6 class="mt-4">
					<a href="<%=request.getContextPath()%>/user/register">アカウントを作成</a>
				</h6>
	</div>
	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</html>