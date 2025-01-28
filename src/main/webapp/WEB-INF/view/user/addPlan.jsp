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
	border: 1px solid #000;
	margin: 1rem;
	padding: 1rem;
}

body {
	text-align: center;
	background-color: #EEEEEE;
}

.time-container {
	width: 300px;
	/* 幅を300pxに設定 */
	height: 300px;
	/* 高さも300pxに設定 */
	background-color: rgb(168, 164, 164);
	/* 背景色を設定（任意） */
	border: 3px solid black;
}

/* 適宜スタイルは調整してください */
.photo-section {
	width: 200px;
}
</style>
</head>

<body>
	<div class="container p-2" style="max-width: 1000px;">
		<h1>旅行プラン作成</h1>
		<form action="" method="post" class="" enctype="multipart/form-data">
			<!-- 基本情報 -->
			<div style="border: 1px solid #ccc; padding: 1rem;">
				<label for="title" class="form-label fs-5">タイトル</label>
				<c:if test="${not empty titleError}">
					<div class="alert alert-danger">
						<c:out value="${titleError}" />
					</div>
				</c:if>
				<input type="text" id="title" name="title"
					value="<c:out value=" ${title}" />" class="form-control"
					placeholder="タイトルを入力">
			</div>
			<div style="border: 1px solid #ccc; padding: 1rem;">

				<label for="place" class="form-label fs-5">目的地</label>
				<c:if test="${not empty placeError}">
					<div class="alert alert-danger">
						<c:out value="${placeError}" />
					</div>
				</c:if>
				<select name="place" id="place" class="form-select w-25 mx-auto">
					<option value="">都道府県を選択</option>

					<!-- 北海道・東北地方 -->
					<optgroup label="北海道・東北">
						<option value="北海道" <c:if test="${'北海道' == place}">selected</c:if>>北海道
						</option>
						<option value="青森県" <c:if test="${'青森県' == place}">selected</c:if>>青森県
						</option>
						<option value="岩手県" <c:if test="${'岩手県' == place}">selected</c:if>>岩手県
						</option>
						<option value="宮城県" <c:if test="${'宮城県' == place}">selected</c:if>>宮城県
						</option>
						<option value="秋田県" <c:if test="${'秋田県' == place}">selected</c:if>>秋田県
						</option>
						<option value="山形県" <c:if test="${'山形県' == place}">selected</c:if>>山形県
						</option>
						<option value="福島県" <c:if test="${'福島県' == place}">selected</c:if>>福島県
						</option>
					</optgroup>

					<!-- 関東地方 -->
					<optgroup label="関東">
						<option value="東京都" <c:if test="${'東京都' == place}">selected</c:if>>東京都
						</option>
						<option value="神奈川県"
							<c:if test="${'神奈川県' == place}">selected</c:if>>神奈川県</option>
						<option value="千葉県" <c:if test="${'千葉県' == place}">selected</c:if>>千葉県
						</option>
						<option value="埼玉県" <c:if test="${'埼玉県' == place}">selected</c:if>>埼玉県
						</option>
						<option value="茨城県" <c:if test="${'茨城県' == place}">selected</c:if>>茨城県
						</option>
						<option value="栃木県" <c:if test="${'栃木県' == place}">selected</c:if>>栃木県
						</option>
						<option value="群馬県" <c:if test="${'群馬県' == place}">selected</c:if>>群馬県
						</option>
						<option value="山梨県" <c:if test="${'山梨県' == place}">selected</c:if>>山梨県
						</option>
					</optgroup>

					<!-- 中部地方 -->
					<optgroup label="中部">
						<option value="新潟県" <c:if test="${'新潟県' == place}">selected</c:if>>新潟県
						</option>
						<option value="富山県" <c:if test="${'富山県' == place}">selected</c:if>>富山県
						</option>
						<option value="石川県" <c:if test="${'石川県' == place}">selected</c:if>>石川県
						</option>
						<option value="福井県" <c:if test="${'福井県' == place}">selected</c:if>>福井県
						</option>
						<option value="長野県" <c:if test="${'長野県' == place}">selected</c:if>>長野県
						</option>
						<option value="岐阜県" <c:if test="${'岐阜県' == place}">selected</c:if>>岐阜県
						</option>
						<option value="静岡県" <c:if test="${'静岡県' == place}">selected</c:if>>静岡県
						</option>
						<option value="愛知県" <c:if test="${'愛知県' == place}">selected</c:if>>愛知県
						</option>
					</optgroup>

					<!-- 関西地方 -->
					<optgroup label="関西">
						<option value="大阪府" <c:if test="${'大阪府' == place}">selected</c:if>>大阪府
						</option>
						<option value="京都府" <c:if test="${'京都府' == place}">selected</c:if>>京都府
						</option>
						<option value="兵庫県" <c:if test="${'兵庫県' == place}">selected</c:if>>兵庫県
						</option>
						<option value="奈良県" <c:if test="${'奈良県' == place}">selected</c:if>>奈良県
						</option>
						<option value="滋賀県" <c:if test="${'滋賀県' == place}">selected</c:if>>滋賀県
						</option>
						<option value="和歌山県"
							<c:if test="${'和歌山県' == place}">selected</c:if>>和歌山県</option>
					</optgroup>

					<!-- 中国地方 -->
					<optgroup label="中国">
						<option value="鳥取県" <c:if test="${'鳥取県' == place}">selected</c:if>>鳥取県
						</option>
						<option value="島根県" <c:if test="${'島根県' == place}">selected</c:if>>島根県
						</option>
						<option value="岡山県" <c:if test="${'岡山県' == place}">selected</c:if>>岡山県
						</option>
						<option value="広島県" <c:if test="${'広島県' == place}">selected</c:if>>広島県
						</option>
						<option value="山口県" <c:if test="${'山口県' == place}">selected</c:if>>山口県
						</option>
					</optgroup>

					<!-- 四国地方 -->
					<optgroup label="四国">
						<option value="徳島県" <c:if test="${'徳島県' == place}">selected</c:if>>徳島県
						</option>
						<option value="香川県" <c:if test="${'香川県' == place}">selected</c:if>>香川県
						</option>
						<option value="愛媛県" <c:if test="${'愛媛県' == place}">selected</c:if>>愛媛県
						</option>
						<option value="高知県" <c:if test="${'高知県' == place}">selected</c:if>>高知県
						</option>
					</optgroup>

					<!-- 九州地方 -->
					<optgroup label="九州・沖縄">
						<option value="福岡県" <c:if test="${'福岡県' == place}">selected</c:if>>福岡県
						</option>
						<option value="佐賀県" <c:if test="${'佐賀県' == place}">selected</c:if>>佐賀県
						</option>
						<option value="長崎県" <c:if test="${'長崎県' == place}">selected</c:if>>長崎県
						</option>
						<option value="熊本県" <c:if test="${'熊本県' == place}">selected</c:if>>熊本県
						</option>
						<option value="大分県" <c:if test="${'大分県' == place}">selected</c:if>>大分県
						</option>
						<option value="宮崎県" <c:if test="${'宮崎県' == place}">selected</c:if>>宮崎県
						</option>
						<option value="鹿児島県"
							<c:if test="${'鹿児島県' == place}">selected</c:if>>鹿児島県</option>
						<option value="沖縄県" <c:if test="${'沖縄県' == place}">selected</c:if>>沖縄県
						</option>
					</optgroup>
				</select>
			</div>
			<p class="fs-5">- スケジュール -</p>
			<c:if test="${not empty errors}">
				<div class="alert alert-danger">
					<ul>
						<c:forEach var="error" items="${errors}">
							<li><c:out value="${error}" /></li>
						</c:forEach>
					</ul>
				</div>
			</c:if>

			<div id="scheduleContainer" class="pb-0 pt-0"
				style="border: 1px solid #ccc; padding: 1rem;">
				<!-- スポット入力欄の初期表示 -->
				<div class="d-flex flex-row align-items-start mb-0 p-0 border-0">
					<!-- スポット、コメントエリア、スポット間アイコンを縦に並べる -->
					<div class="d-flex flex-column w-75">
						<!-- スポット名入力 -->
						<input type="text" name="schedulePlace[]"
							class="form-control mb-2" placeholder="スポット名" />
						<textarea name="scheduleComment[]" class="form-control mb-2"
							placeholder="説明やおすすめポイント"></textarea>
					</div>
					<!-- 写真を追加ボタン: 右側に配置 -->
					<div class="photo-section ms-3 border-0">
						<input type="file" name="scheduleImage[]"
							class="form-control mb-2 schedule-image-input" accept="image/*" />
						<img class="img-preview mb-2"
							style="max-width: 200px; display: none;" />
					</div>
				</div>
				<!-- 移動手段 + 所要時間 -->
				<div
					class="d-flex justify-content-center align-items-center mx-4 p-0 border-0">
					<div class="display-5 d-flex flex-column me-0 border-0">
						<span class="bi bi-caret-down"></span> <span
							class="bi bi-caret-down"></span> <span class="bi bi-caret-down"></span>
					</div>
					<div class="container border-0">
						<h5>次のスポットまでの所要時間</h5>
						<div class="d-flex align-items-center gap-3 m-0  border-0">
							<select name="scheduleTransport[]" class="form-select">
								<option value="">選択</option>
								<option value="徒歩">徒歩</option>
								<option value="自転車">自転車</option>
								<option value="車">車</option>
								<option value="バス">バス</option>
								<option value="電車">電車</option>
								<option value="新幹線">新幹線</option>
								<option value="フェリー">フェリー</option>
								<option value="飛行機">飛行機</option>
							</select> <span>:</span> <select name="hours[]" class="form-select">
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
							</select><span>時間</span> <select name="minutes[]" class="form-select">
								<option value="">0</option>
								<option value="5">5</option>
								<option value="10">10</option>
								<option value="15">15</option>
								<option value="30">30</option>
								<option value="45">45</option>
							</select> <span>分</span>
						</div>
					</div>
				</div>

				<!-- スポット名/コメント/画像 -->
				<div class="d-flex flex-row align-items-start mb-0 p-0 border-0">
					<div class="d-flex flex-column w-75">
						<input type="text" name="schedulePlace[]"
							class="form-control mb-2" placeholder="スポット名" />
						<textarea name="scheduleComment[]" class="form-control mb-2"
							placeholder="説明やおすすめポイント"></textarea>
					</div>
					<div class="photo-section ms-3 border-0">
						<input type="file" name="scheduleImage[]"
							class="form-control mb-2 schedule-image-input" accept="image/*" />
						<img class="img-preview mb-2"
							style="max-width: 200px; display: none;" />
					</div>
				</div>
			</div>
			<!-- ▼ テンプレート: 「スポットを追加」ボタンで複製するときの構造 (所要時間 → スポット名/画像 → 削除ボタン) -->
			<template id="scheduleTemplate">
				<div class="schedule-item position-relative border-0">
					<!-- 移動手段 + 所要時間 -->
					<div
						class="d-flex justify-content-center align-items-center m-0 p-0 border-0">
						<div class="display-5 d-flex flex-column me-0 border-0">
							<span class="bi bi-caret-down"></span> <span
								class="bi bi-caret-down"></span> <span class="bi bi-caret-down"></span>
						</div>
						<div class="container border-0">
							<h5>次のスポットまでの所要時間</h5>
							<div class="d-flex align-items-center gap-3 m-0 border-0">
								<select name="scheduleTransport[]" class="form-select">
									<option value="">選択</option>
									<option value="徒歩">徒歩</option>
									<option value="自転車">自転車</option>
									<option value="車">車</option>
									<option value="バス">バス</option>
									<option value="電車">電車</option>
									<option value="新幹線">新幹線</option>
									<option value="フェリー">フェリー</option>
									<option value="飛行機">飛行機</option>
								</select> <span>:</span> <select name="hours[]" class="form-select">
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
								</select> <span>時間</span> <select name="minutes[]" class="form-select">
									<option value="">0</option>
									<option value="5">5</option>
									<option value="10">10</option>
									<option value="15">15</option>
									<option value="30">30</option>
									<option value="45">45</option>
								</select> <span>分</span>
							</div>
						</div>
					</div>

					<!-- スポット名/コメント/画像 -->
					<div class="d-flex flex-row align-items-start m-0 p-0 border-0">
						<div class="d-flex flex-column w-75">
							<input type="text" name="schedulePlace[]"
								class="form-control mb-2" placeholder="スポット名" />
							<textarea name="scheduleComment[]" class="form-control mb-2"
								placeholder="説明やおすすめポイント"></textarea>
						</div>
						<div class="photo-section ms-3 border-0">
							<input type="file" name="scheduleImage[]"
								class="form-control mb-2 schedule-image-input" accept="image/*" />
							<img class="img-preview mb-2"
								style="max-width: 200px; display: none;" />
						</div>
					</div>

					<!-- 項目削除するボタン -->
					<button type="button"
						class="btn btn-danger remove-button position-absolute bottom-0 end-0">
						ー</button>
				</div>
			</template>


			<!-- 項目を追加するボタン -->
				<button id="addSpotButton" type="button" class="btn btn-secondary">＋</button>
		</div>
		<button type=" submit" class="btn btn-primary mb-3">登録</button>
		</form>
		<p>
			<a href="<%=request.getContextPath()%>/user/top">トップに戻る </a>
		</p>


	<script>
	document.addEventListener("DOMContentLoaded", () => {
	    const scheduleContainer = document.getElementById("scheduleContainer");
	    const addSpotButton = document.getElementById("addSpotButton");
	    const scheduleTemplate = document.getElementById("scheduleTemplate");

	    // スポットを追加するボタン → テンプレートを複製
	    addSpotButton.addEventListener("click", () => {
	        if (scheduleTemplate) {
	            // テンプレートを取得し複製
	            const template = scheduleTemplate.content.cloneNode(true);

	            // フィールドを初期化
	            template.querySelectorAll("input, textarea").forEach(input => {
	                input.value = "";
	            });

	            // プレビュー画像を非表示
	            const imgPreview = template.querySelector(".img-preview");
	            if (imgPreview) imgPreview.style.display = "none";

	            // コンテナにテンプレートを追加
	            scheduleContainer.appendChild(template);
	        } else {
	            console.error("テンプレートが見つかりませんでした");
	        }
	    });

	    // イベント委譲: 画像プレビュー
	    scheduleContainer.addEventListener("change", (event) => {
	        if (event.target.classList.contains("schedule-image-input")) {
	            const fileInput = event.target;
	            const imgPreview = fileInput.nextElementSibling;
	            if (fileInput.files && fileInput.files[0]) {
	                const reader = new FileReader();
	                reader.onload = (e) => {
	                    imgPreview.src = e.target.result;
	                    imgPreview.style.display = "block";
	                };
	                reader.readAsDataURL(fileInput.files[0]);
	            } else {
	                imgPreview.style.display = "none";
	            }
	        }
	    });

	    // イベント委譲: 削除ボタン
	    scheduleContainer.addEventListener("click", (event) => {
	        if (event.target.classList.contains("remove-button")) {
	            const scheduleItem = event.target.closest(".schedule-item");
	            if (scheduleItem) scheduleItem.remove();
	        }
	    });
	});

	</script>

	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>

</html>