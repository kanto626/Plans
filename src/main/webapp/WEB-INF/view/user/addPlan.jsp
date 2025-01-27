<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	margin: 1rem;
	padding: 1rem;
}

body {
	text-align: center;
	background-color: #f9f9f9;
}

/* 適宜スタイルは調整してください */
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
					value="<c:out value=" ${title}" />" class="form-control"
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
						@@ -108,403 +112,167 @@ body {
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



			<div>
				<h3 class="">- スケジュール -</h3>
			</div>
			<c:if test="${not empty errors}">
				<div class="alert alert-danger">
					<ul>
						<c:forEach var="error" items="${errors}">
							<li><c:out value="${error}" /></li>
						</c:forEach>
					</ul>
				</div>
			</c:if>

			<div id="scheduleContainer">
				<c:choose>
					<c:when test="${not empty schedulePlaces}">
						<c:forEach var="i" begin="0"
							end="${fn:length(schedulePlaces) - 1}">
							<div class="schedule-item mb-3">
								<input type="text" name="schedulePlace[]"
									class="form-control mb-2" value="${schedulePlaces[i]}" />
								<textarea name="scheduleComment[]" class="form-control mb-2">${scheduleComments[i]}</textarea>
								<!-- 画像 -->
								<div class="photo-section">
									<input type="file" name="scheduleImage[]"
										onchange="previewImage(event, this)" /> <img src="#"
										alt="プレビュー画像" style="display: none;" />
									<c:if test="${not empty scheduleImages[i]}">
										<img src="${scheduleImages[i]}" alt="既存画像"
											style="max-width: 300px;" />
									</c:if>
								</div>
								<!-- 移動手段 -->
								<select name="scheduleTransport[]">
									<c:forEach var="transport" items="${['徒歩', '車', 'バス']}">
										<option value="${transport}"
											${scheduleTransports[i] == transport ? 'selected' : ''}>${transport}</option>
									</c:forEach>
								</select>
								<!-- 時間と分 -->
								<select name="hours[]">
									<option value="" ${hours[i] == '' ? 'selected' : ''}>設定しない</option>
									<c:forEach var="hour" begin="1" end="10">
										<option value="${hour}" ${hours[i] == hour ? 'selected' : ''}>${hour}</option>
									</c:forEach>
								</select> <select name="minutes[]">
									<c:forEach var="minute" items="${[5, 10, 15, 30]}">
										<option value="${minute}"
											${minutes[i] == minute ? 'selected' : ''}>${minute}</option>
									</c:forEach>
								</select>
								 <!-- 削除ボタン -->
                    <button type="button" class="btn btn-danger remove-button">削除</button>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<!-- 初期表示用の空フォーム -->
						<div class="schedule-item mb-3">
							<input type="text" name="schedulePlace[]"
								class="form-control mb-2" />
							<textarea name="scheduleComment[]" class="form-control mb-2"></textarea>
							<div class="photo-section ms-3">
							<input type="file" name="scheduleImage[]"
								class="form-control mb-2 image-input" accept="image/*">
							<img src="#" alt="プレビュー" class="img-preview"
								style="max-width: 200px; display: none;" />
						</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>



			<!-- ▼ テンプレート: 「スポットを追加」ボタンで複製するときの構造 (所要時間 → スポット名/画像 → 削除ボタン) -->
			<template id="scheduleTemplate">
				<div class="schedule-item mb-3"
					style="border: 1px solid #ccc; padding: 1rem;">



					<!-- 移動手段 + 所要時間 -->
					<div class="d-flex justify-content-center align-items-center mt-3">
						<div class="display-5 d-flex flex-column me-0">
							<i class="bi bi-caret-down"></i> <i class="bi bi-caret-down"></i>
							<i class="bi bi-caret-down"></i>
						</div>
						<div>
							<span>次のスポットまでの所要時間</span>
							<div class="d-flex align-items-center gap-3 ms-0">
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
								</select> <span>時間</span> <select name="minutes[]" class="form-select">
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

					<!-- スポット名/コメント/画像 -->
					<div class="d-flex flex-row align-items-start mt-3">
						<div class="d-flex flex-column w-75">
							<input type="text" name="schedulePlace[]"
								class="form-control mb-2" placeholder="スポット名"
								value="${not empty schedulePlace ? schedulePlace : ''}">

							<textarea name="scheduleComment[]" class="form-control mb-2"
								placeholder="説明やおすすめポイント"></textarea>
						</div>
						<div class="photo-section ms-3">
							<input type="file" name="scheduleImage[]"
								class="form-control mb-2 image-input" accept="image/*">
							<img src="#" alt="プレビュー" class="img-preview"
								style="max-width: 200px; display: none;" />
						</div>
					</div>
					<!-- 削除ボタン -->
					<button type="button" class="btn btn-danger remove-button">削除</button>
				</div>
			</template>

			<!-- 項目を追加するボタン -->
			<button id="addSpotButton" type="button" class="btn btn-primary">スポットを追加</button>
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
	document.addEventListener('DOMContentLoaded', () => {
	    const container = document.getElementById('scheduleContainer');

	    // 「スポットを追加」ボタン → テンプレートを複製
	    document.getElementById('addSpotButton').addEventListener('click', function () {
	        const template = document.getElementById('scheduleTemplate').content.cloneNode(true);
	        container.appendChild(template);
	        setupRemoveButton(container);
	        setupImagePreview(container); // プレビュー機能を追加
	    });

	    // 初期の削除ボタンとプレビュー設定
	    setupRemoveButton(container);
	    setupImagePreview(container);
	});

	// 削除ボタンの設定
	function setupRemoveButton(container) {
	    const removeButtons = container.querySelectorAll('.remove-button');
	    removeButtons.forEach((button) => {
	        button.addEventListener('click', function () {
	            button.closest('.schedule-item').remove(); // 親要素を削除
	        });
	    });
	}

	// プレビュー機能の設定
	function setupImagePreview(container) {
	    const imageInputs = container.querySelectorAll('.image-input');
	    imageInputs.forEach((input) => {
	        input.addEventListener('change', function (event) {
	            const file = event.target.files[0];
	            const preview = input.nextElementSibling; // プレビュー画像のimg要素
	            if (file) {
	                const reader = new FileReader();
	                reader.onload = function (e) {
	                    preview.src = e.target.result; // 画像のURLを設定
	                    preview.style.display = 'block'; // 表示
	                };
	                reader.readAsDataURL(file); // 画像ファイルを読み込む
	            } else {
		            
	                preview.style.display = 'none'; // 非表示
	                preview.src = '#';
	            }
	        });
	    });
	}

	</script>

	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>

</html>
