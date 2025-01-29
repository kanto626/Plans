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
    <h2>ユーザー情報</h2>
    <p>管理番号: ${user.id}</p>
    <p>ID: ${user.loginId}</p>
    <p>ユーザー名: ${user.name}</p>
    <a href="deleteUser?id=<c:out value="${user.id}" />">削除</a>

    <h2>登録した旅行プラン</h2>
    
    <!-- テーブル形式に変更 -->
    <table border="1">
        <thead>
            <tr>
                <th>旅行プランタイトル</th>
                <th>場所</th>
                <th>登録日</th>
                <th>詳細</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="plan" items="${plans}">
                <tr>
                    <td><strong><a href="<%=request.getContextPath()%>/user/planShow?id=${plan.id}">${plan.title}</a></strong></td>
                    <td>${plan.place}</td>
                    <td>${plan.registeredAt}</td>
                    <td><a href="<%=request.getContextPath()%>/user/planShow?id=${plan.id}">詳細を見る</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <a href="<%=request.getContextPath()%>/admin/users">ユーザーリストに戻る</a>
</body>
</html>
