<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	border: 1px solid #000;
	/* 境界線のスタイル */
	margin: 1rem;
	/* すべての方向に余白を追加 */
	padding: 1rem;
	/* 境界線の内側に余白を追加 */
}
/* addPlan*/
body {
	text-align: center;
	background-color: #f9f9f9;
}
</style>
</head>
<body>
	<div>
		<h1>旅行プラン作成</h1>
	</div>
	<form action="" method="post" class="" enctype="multipart/form-data">
		<!-- 基本情報 -->
		<div class="container">

			<div class="container">
				<h3 label for="title" class="form-label">タイトル</h3>
				<c:if test="${not empty titleError}">
					<div class="alert alert-danger">
						<c:out value="${titleError}" />
					</div>
				</c:if>
				<input type="text" id="title" name="title"
					value="<c:out value="${title}" />" class="form-control"
					placeholder="タイトルを入力">

			</div>

			<div class="container">

				<label for="place" class="form-label">目的地 : </label>
				<c:if test="${not empty placeError}">
					<div class="alert alert-danger">
						<c:out value="${placeError}" />
					</div>
				</c:if>
				<select name="place" id="place" class="form-select">
					<option value="">都道府県を選択</option>

					<!-- 北海道・東北地方 -->
					<optgroup label="北海道・東北">
						<option value="北海道" <c:if test="${'北海道' == place}">selected</c:if>>北海道</option>
						<option value="青森県" <c:if test="${'青森県' == place}">selected</c:if>>青森県</option>
						<option value="岩手県" <c:if test="${'岩手県' == place}">selected</c:if>>岩手県</option>
						<option value="宮城県" <c:if test="${'宮城県' == place}">selected</c:if>>宮城県</option>
						<option value="秋田県" <c:if test="${'秋田県' == place}">selected</c:if>>秋田県</option>
						<option value="山形県" <c:if test="${'山形県' == place}">selected</c:if>>山形県</option>
						<option value="福島県" <c:if test="${'福島県' == place}">selected</c:if>>福島県</option>
					</optgroup>

					<!-- 関東地方 -->
					<optgroup label="関東">
						<option value="東京都" <c:if test="${'東京都' == place}">selected</c:if>>東京都</option>
						<option value="神奈川県"
							<c:if test="${'神奈川県' == place}">selected</c:if>>神奈川県</option>
						<option value="千葉県" <c:if test="${'千葉県' == place}">selected</c:if>>千葉県</option>
						<option value="埼玉県" <c:if test="${'埼玉県' == place}">selected</c:if>>埼玉県</option>
						<option value="茨城県" <c:if test="${'茨城県' == place}">selected</c:if>>茨城県</option>
						<option value="栃木県" <c:if test="${'栃木県' == place}">selected</c:if>>栃木県</option>
						<option value="群馬県" <c:if test="${'群馬県' == place}">selected</c:if>>群馬県</option>
						<option value="山梨県" <c:if test="${'山梨県' == place}">selected</c:if>>山梨県</option>
					</optgroup>

					<!-- 中部地方 -->
					<optgroup label="中部">
						<option value="新潟県" <c:if test="${'新潟県' == place}">selected</c:if>>新潟県</option>
						<option value="富山県" <c:if test="${'富山県' == place}">selected</c:if>>富山県</option>
						<option value="石川県" <c:if test="${'石川県' == place}">selected</c:if>>石川県</option>
						<option value="福井県" <c:if test="${'福井県' == place}">selected</c:if>>福井県</option>
						<option value="長野県" <c:if test="${'長野県' == place}">selected</c:if>>長野県</option>
						<option value="岐阜県" <c:if test="${'岐阜県' == place}">selected</c:if>>岐阜県</option>
						<option value="静岡県" <c:if test="${'静岡県' == place}">selected</c:if>>静岡県</option>
						<option value="愛知県" <c:if test="${'愛知県' == place}">selected</c:if>>愛知県</option>
					</optgroup>

					<!-- 関西地方 -->
					<optgroup label="関西">
						<option value="大阪府" <c:if test="${'大阪府' == place}">selected</c:if>>大阪府</option>
						<option value="京都府" <c:if test="${'京都府' == place}">selected</c:if>>京都府</option>
						<option value="兵庫県" <c:if test="${'兵庫県' == place}">selected</c:if>>兵庫県</option>
						<option value="奈良県" <c:if test="${'奈良県' == place}">selected</c:if>>奈良県</option>
						<option value="滋賀県" <c:if test="${'滋賀県' == place}">selected</c:if>>滋賀県</option>
						<option value="和歌山県"
							<c:if test="${'和歌山県' == place}">selected</c:if>>和歌山県</option>
					</optgroup>

					<!-- 中国地方 -->
					<optgroup label="中国">
						<option value="鳥取県" <c:if test="${'鳥取県' == place}">selected</c:if>>鳥取県</option>
						<option value="島根県" <c:if test="${'島根県' == place}">selected</c:if>>島根県</option>
						<option value="岡山県" <c:if test="${'岡山県' == place}">selected</c:if>>岡山県</option>
						<option value="広島県" <c:if test="${'広島県' == place}">selected</c:if>>広島県</option>
						<option value="山口県" <c:if test="${'山口県' == place}">selected</c:if>>山口県</option>
					</optgroup>

					<!-- 四国地方 -->
					<optgroup label="四国">
						<option value="徳島県" <c:if test="${'徳島県' == place}">selected</c:if>>徳島県</option>
						<option value="香川県" <c:if test="${'香川県' == place}">selected</c:if>>香川県</option>
						<option value="愛媛県" <c:if test="${'愛媛県' == place}">selected</c:if>>愛媛県</option>
						<option value="高知県" <c:if test="${'高知県' == place}">selected</c:if>>高知県</option>
					</optgroup>

					<!-- 九州地方 -->
					<optgroup label="九州・沖縄">
						<option value="福岡県" <c:if test="${'福岡県' == place}">selected</c:if>>福岡県</option>
						<option value="佐賀県" <c:if test="${'佐賀県' == place}">selected</c:if>>佐賀県</option>
						<option value="長崎県" <c:if test="${'長崎県' == place}">selected</c:if>>長崎県</option>
						<option value="熊本県" <c:if test="${'熊本県' == place}">selected</c:if>>熊本県</option>
						<option value="大分県" <c:if test="${'大分県' == place}">selected</c:if>>大分県</option>
						<option value="宮崎県" <c:if test="${'宮崎県' == place}">selected</c:if>>宮崎県</option>
						<option value="鹿児島県"
							<c:if test="${'鹿児島県' == place}">selected</c:if>>鹿児島県</option>
						<option value="沖縄県" <c:if test="${'沖縄県' == place}">selected</c:if>>沖縄県</option>
					</optgroup>
				</select>

			</div>

			<div class="container">
				<!-- カテゴリーの選択 -->
				<label>カテゴリ:</label><br>
				<c:forEach var="category" items="${categories}">
					<input type="checkbox" name="categoryIds" value="${category.id}"> ${category.name}<br>
				</c:forEach>
			</div>

			<div>
				<h3 class="">- スケジュール -</h3>
			</div>
			<div id="scheduleContainer">
				<!-- スポット入力欄の初期表示 -->
				<div class="d-flex flex-row align-items-start mt-3">
					<!-- スポット、コメントエリア、スポット間アイコンを縦に並べる -->
					<div class="d-flex flex-column w-75">
						<!-- スポット名入力 -->

						<c:if test="${not empty schedulePlacesError}">
							<div class="alert alert-danger">
								<c:out value="${schedulePlacesError}" />
							</div>
						</c:if>

						<input type="text" name="schedulePlace[]"
							class="form-control mb-2" placeholder="スポット名">
						<!-- コメントエリア -->
						<textarea name="scheduleComment[]" class="form-control mb-2"
							placeholder="説明やおすすめポイント"></textarea>
					</div>
					<c:if test="${not empty scheduleImagesError}">
						<div class="alert alert-danger">
							<c:out value="${scheduleImagesError}" />
						</div>
					</c:if>
					<!-- 写真を追加ボタン: 右側に配置 -->
					<div class="photo-section ms-3">
						<input type="file" name="scheduleImage[]"
							class="form-control mb-2" placeholder="写真の追加">
					</div>
				</div>


				<div class="d-flex justify-content-center">

					<!-- アイコン部分 -->
					<div class="display-5 d-flex flex-column me-0">
						<!-- me-0 で右側の余白をゼロに設定 -->
						<i class="bi bi-caret-down"></i> <i class="bi bi-caret-down"></i>
						<i class="bi bi-caret-down"></i>
					</div>

					<div>
						<!-- 次のスポットまでの所要時間のフォーム部分 -->
						<span>次のスポットまでの所要時間</span>
						<c:if test="${not empty scheduleTransportsError}">
							<div class="alert alert-danger">
								<c:out value="${scheduleTransportsError}" />
							</div>
						</c:if>


						<div class="d-flex align-items-center gap-3 ms-0">
							<!-- Transport Selection -->
							<select name="scheduleTransport[]" class="form-select">
								<option value="">設定しない</option>
								<option value="徒歩">徒歩</option>
								<option value="自転車">自転車</option>
								<option value="車">車</option>
								<option value="バス">バス</option>
								<option value="電車">電車</option>
								<option value="新幹線">新幹線</option>
								<option value="フェリー">フェリー</option>
								<option value="飛行機">飛行機</option>
							</select> <span>:</span> <select id="hourSelect" name="hours[]"
								class="form-select">
								<option value="">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select> <span style="white-space: nowrap;">時間</span>

							<!-- Minute Selection -->
							<select id="minuteSelect" name="minutes[]" class="form-select">
								<option value="">0</option>
								<option value="3">3</option>
								<option value="5">5</option>
								<option value="10">10</option>
								<option value="15">15</option>
								<option value="20">20</option>
								<option value="25">25</option>
								<option value="30">30</option>
								<option value="35">35</option>
								<option value="40">40</option>
								<option value="45">45</option>
								<option value="50">50</option>
								<option value="55">55</option>
							</select> <span>分</span>
						</div>

					</div>
				</div>
			</div>

			<template id="scheduleTemplate">

				<div class="schedule-item">
					<div class="d-flex flex-row align-items-start mt-3">
						<div class="d-flex flex-column w-75">
							<input type="text" name="schedulePlace[]"
								class="form-control mb-2" placeholder="スポット名">
							<textarea name="scheduleComment[]" class="form-control mb-2"
								placeholder="説明やおすすめポイント"></textarea>
						</div>



						<div class="photo-section ms-3">
							<input type="file" name="scheduleImage[]"
								class="form-control mb-2" placeholder="写真の追加">
						</div>

					</div>
					<button class="remove-button btn btn-danger ms-3">削除</button>
				</div>

				<div class="d-flex justify-content-center">
					<div class="display-5 d-flex flex-column me-0">
						<i class="bi bi-caret-down"></i> <i class="bi bi-caret-down"></i>
						<i class="bi bi-caret-down"></i>
					</div>

					<div>
						<span>次のスポットまでの所要時間</span>
						<c:if test="${not empty scheduleTransportsError}">
							<div class="alert alert-danger">
								<c:out value="${scheduleTransportsError}" />
							</div>
						</c:if>
						<div class="d-flex align-items-center gap-3 ms-0">
							<select name="scheduleTransport[]" class="form-select">
								<option value="">設定しない</option>
								<option value="徒歩">徒歩</option>
								<option value="車">車</option>
								<option value="バス">バス</option>
								<option value="電車">電車</option>
								<option value="自転車">自転車</option>
								<option value="フェリー">フェリー</option>
							</select> <span>:</span> <select name="hours[]" class="form-select">
								<option value="">設定しない</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select> <span style="white-space: nowrap;">時間</span> <select
								name="minutes[]" class="form-select">
								<option value="">設定しない</option>
								<option value="3">3</option>
								<option value="5">5</option>
								<option value="10">10</option>
								<option value="15">15</option>
								<option value="20">20</option>
								<option value="25">25</option>
								<option value="30">30</option>
								<option value="35">35</option>
								<option value="40">40</option>
								<option value="45">45</option>
								<option value="50">50</option>
								<option value="55">55</option>
							</select> <span>分</span>
						</div>
					</div>
				</div>
		</div>
		</template>

		<!-- 項目を追加するボタン -->
		<button id="addSpotButton">スポットを追加</button>
		</div>
		<button type="submit" class="btn btn-primary">登録</button>
		</div>
	</form>
	<div>
		<p>
			<a href="<%=request.getContextPath()%>/user/top">トップに戻る </a>
		</p>
	</div>

	<script>
		// 項目を追加するボタンのクリックイベント
		document.getElementById('addSpotButton').addEventListener('click',
				function(event) {
					event.preventDefault(); // フォーム送信を防ぐ
					addScheduleItem();
				});

		function addScheduleItem() {
			// 親コンテナを取得
			const container = document.getElementById('scheduleContainer');
			// テンプレートを複製
			const template = document.getElementById('scheduleTemplate').content
					.cloneNode(true);
			// 削除ボタンのイベント設定
			template.querySelector('.remove-button').addEventListener('click',
					function() {
						this.closest('.schedule-item').remove();
					});
			// コンテナにテンプレートを追加
			container.appendChild(template);
		}
	</script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>

</html>
