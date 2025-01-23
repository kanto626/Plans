<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>userManage</title>
</head>
<body>
	<h1>ユーザー情報</h1>
	<p>管理番号:${user.id}</p>
	<p>ID: ${user.loginId}</p>
	<p>ユーザー名: ${user.name}</p>
<a href="deleteUser?id=<c:out value="${user.id}" />">削除
</a>
	<h2>旅行プラン</h2>
	<!-- 旅行プランの一覧を表示 -->
<h2>登録した旅行プラン</h2>
            
                    <ul>
                        <c:forEach var="plan" items="${plans}">
                            <li>
                                <strong><a href="<%=request.getContextPath()%>/user/planShow?id=${plan.id}">${plan.title}</strong><br>
                                場所: ${plan.place}<br>
                                登録日: ${plan.registeredAt}
                            </li>
                        </c:forEach>
                    </ul>
         
	<a href="<%=request.getContextPath()%>/admin/users">ユーザーリストに戻る</a>
</body>
</html>