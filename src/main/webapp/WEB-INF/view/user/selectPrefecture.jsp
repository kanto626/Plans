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
<title>selectPrefecture</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<style>
   body, html {
            height: 100%;
        }
        select {
    position: relative;
    z-index: 1050;
}
        
</style>
</head>

	<body class="d-flex justify-content-center align-items-center vh-100">
    <div class="text-center p-4 border border-secondary"style="background-color: white;">
			<h1 class="p-3">旅行プラン検索</h1>
			
			<form action="<%=request.getContextPath()%>/user/selectPrefecture"
				method="post">
				<label for="prefecture"></label> <select name="prefecture"
					id="prefecture">
					<option value="北海道">北海道</option>
					<optgroup label="東北">
						<option value="青森県">青森県</option>
						<option value="岩手県">岩手県</option>
						<option value="宮城県">宮城県</option>
						<option value="秋田県">秋田県</option>
						<option value="山形県">山形県</option>
						<option value="福島県">福島県</option>
					</optgroup>
					<optgroup label="関東">
						<option value="茨城県">茨城県</option>
						<option value="栃木県">栃木県</option>
						<option value="群馬県">群馬県</option>
						<option value="埼玉県">埼玉県</option>
						<option value="千葉県">千葉県</option>
						<option value="東京都">東京都</option>
						<option value="神奈川県">神奈川県</option>
					</optgroup>
					<optgroup label="中部">
						<option value="新潟県">新潟県</option>
						<option value="富山県">富山県</option>
						<option value="石川県">石川県</option>
						<option value="福井県">福井県</option>
						<option value="山梨県">山梨県</option>
						<option value="長野県">長野県</option>
						<option value="岐阜県">岐阜県</option>
						<option value="静岡県">静岡県</option>
						<option value="愛知県">愛知県</option>
					</optgroup>
					<optgroup label="近畿">
						<option value="三重県">三重県</option>
						<option value="滋賀県">滋賀県</option>
						<option value="京都府">京都府</option>
						<option value="大阪府">大阪府</option>
						<option value="兵庫県">兵庫県</option>
						<option value="奈良県">奈良県</option>
						<option value="和歌山県">和歌山県</option>
					</optgroup>
					<optgroup label="中国">
						<option value="鳥取県">鳥取県</option>
						<option value="島根県">島根県</option>
						<option value="岡山県">岡山県</option>
						<option value="広島県">広島県</option>
						<option value="山口県">山口県</option>
					</optgroup>
					<optgroup label="四国">
						<option value="徳島県">徳島県</option>
						<option value="香川県">香川県</option>
						<option value="愛媛県">愛媛県</option>
						<option value="高知県">高知県</option>
					</optgroup>
					<optgroup label="九州">
						<option value="福岡県">福岡県</option>
						<option value="佐賀県">佐賀県</option>
						<option value="長崎県">長崎県</option>
						<option value="熊本県">熊本県</option>
						<option value="大分県">大分県</option>
						<option value="宮崎県">宮崎県</option>
						<option value="鹿児島県">鹿児島県</option>
					</optgroup>
					<option value="沖縄県">沖縄県</option>
				</select>
				<button type="submit">検索</button>
			</form>
			<p>目的地を選択してください</p>
			<p>
				<a href="<%=request.getContextPath()%>/user/home">ホーム</a>
			</p>
			</div>
			<script
				src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</html>
