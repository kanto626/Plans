<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<!doctype html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<title>addPlan</title>
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
	border: 1px solid #ccc;
	margin: 1rem;
	padding: 1rem;
}
</style>
</head>

<body>
     <div class="container my-5 border-0">
        <!-- 都道府県が選択されていれば表示 -->
        <c:if test="${not empty selectedPrefecture}">
            <h4 class="text-center">${selectedPrefecture}の旅行プラン</h2>
        </c:if>
      </div>
    <div class="container my-5" style="border: 1px solid #ccc; padding: 1rem;">

        <!-- 旅行プランの一覧を表示 -->
        <table class="table table-hover table-bordered mt-4">
            <thead class="">
                <tr>
                   <th style="width: 70%;">タイトル</th>
                    <th style="width: 30%;">投稿者</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${plans}" var="p">
                    <tr>
                        <td><a href="planShow?id=<c:out value='${p.id}' />"><c:out value="${p.title}" /></a></td>
                        <td><c:out value="${p.user.name}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    	<a href="<%=request.getContextPath()%>/user/selectPrefecture">検索に戻る</a>
    <script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</html>
