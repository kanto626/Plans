<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>マイページ</title>
</head>
<body>
	<h1>マイページ</h1>
	<p>
		<a href="<%=request.getContextPath()%>/user/myPlans">マイプランリスト</a>
	</p>
</body>
</html>