<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>editPlan</title>
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

	<h1>旅行プラン編集</h1>

	<form action="" method="post" class="" enctype="multipart/form-data">
		<!-- プランIDを隠しフィールドで送信 -->
		<input type="hidden" name="id" value="${plan.id}" />
		<!-- 基本情報 -->
		<div class="container">

			<div class="container">
				<label for="title" class="form-label"><h3>タイトル</h3></label>
				<c:if test="${not empty titleError}">
					<div class="alert alert-danger">
						<c:out value="${titleError}" />
					</div>
				</c:if>
				<input type="text" id="title" name="title"
					value="<c:out  value="${plan.title}" />" class="form-control"
					placeholder="タイトルを入力">
			</div>

			<div class="container">

				<!-- 目的地 -->

				<label for="place" class="form-label"><h3>目的地</h3></label>
				<c:if test="${not empty placeError}">
					<div class="alert alert-danger">
						<c:out value="${placeError}" />
					</div>
				</c:if>

				<select name="place" id="place" class="form-select">
					<option value="">都道府県を選択</option>
					<!-- 北海道・東北地方 -->
					<optgroup label="北海道・東北">
						<option value="北海道"
							${plan.place != null && plan.place.trim().replace("県", "") == '北海道' ? 'selected' : ''}>北海道</option>
						<option value="青森"
							${plan.place != null && plan.place.trim().replace("県", "") == '青森' ? 'selected' : ''}>青森</option>
						<option value="岩手"
							${plan.place != null && plan.place.trim().replace("県", "") == '岩手' ? 'selected' : ''}>岩手</option>
						<option value="宮城"
							${plan.place != null && plan.place.trim().replace("県", "") == '宮城' ? 'selected' : ''}>宮城</option>
						<option value="秋田"
							${plan.place != null && plan.place.trim().replace("県", "") == '秋田' ? 'selected' : ''}>秋田</option>
						<option value="山形"
							${plan.place != null && plan.place.trim().replace("県", "") == '山形' ? 'selected' : ''}>山形</option>
						<option value="福島"
							${plan.place != null && plan.place.trim().replace("県", "") == '福島' ? 'selected' : ''}>福島</option>
					</optgroup>
					<!-- 関東地方 -->
					<optgroup label="関東">
						<option value="茨城"
							${plan.place != null && plan.place.trim().replace("県", "") == '茨城' ? 'selected' : ''}>茨城</option>
						<option value="栃木"
							${plan.place != null && plan.place.trim().replace("県", "") == '栃木' ? 'selected' : ''}>栃木</option>
						<option value="群馬"
							${plan.place != null && plan.place.trim().replace("県", "") == '群馬' ? 'selected' : ''}>群馬</option>
						<option value="埼玉"
							${plan.place != null && plan.place.trim().replace("県", "") == '埼玉' ? 'selected' : ''}>埼玉</option>
						<option value="千葉"
							${plan.place != null && plan.place.trim().replace("県", "") == '千葉' ? 'selected' : ''}>千葉</option>
						<option value="東京"
							${plan.place != null && plan.place.trim().replace("県", "") == '東京' ? 'selected' : ''}>東京</option>
						<option value="神奈川"
							${plan.place != null && plan.place.trim().replace("県", "") == '神奈川' ? 'selected' : ''}>神奈川</option>
					</optgroup>
					<!-- 中部地方 -->
					<optgroup label="中部">
						<option value="新潟"
							${plan.place != null && plan.place.trim().replace("県", "") == '新潟' ? 'selected' : ''}>新潟</option>
						<option value="富山"
							${plan.place != null && plan.place.trim().replace("県", "") == '富山' ? 'selected' : ''}>富山</option>
						<option value="石川"
							${plan.place != null && plan.place.trim().replace("県", "") == '石川' ? 'selected' : ''}>石川</option>
						<option value="福井"
							${plan.place != null && plan.place.trim().replace("県", "") == '福井' ? 'selected' : ''}>福井</option>
						<option value="山梨"
							${plan.place != null && plan.place.trim().replace("県", "") == '山梨' ? 'selected' : ''}>山梨</option>
						<option value="長野"
							${plan.place != null && plan.place.trim().replace("県", "") == '長野' ? 'selected' : ''}>長野</option>
						<option value="岐阜"
							${plan.place != null && plan.place.trim().replace("県", "") == '岐阜' ? 'selected' : ''}>岐阜</option>
						<option value="静岡"
							${plan.place != null && plan.place.trim().replace("県", "") == '静岡' ? 'selected' : ''}>静岡</option>
						<option value="愛知"
							${plan.place != null && plan.place.trim().replace("県", "") == '愛知' ? 'selected' : ''}>愛知</option>
					</optgroup>
					<!-- 関西地方 -->
					<optgroup label="関西">
						<option value="三重"
							${plan.place != null && plan.place.trim().replace("県", "") == '三重' ? 'selected' : ''}>三重</option>
						<option value="滋賀"
							${plan.place != null && plan.place.trim().replace("県", "") == '滋賀' ? 'selected' : ''}>滋賀</option>
						<option value="京都"
							${plan.place != null && plan.place.trim().replace("県", "") == '京都' ? 'selected' : ''}>京都</option>
						<option value="大阪"
							${plan.place != null && plan.place.trim().replace("県", "") == '大阪' ? 'selected' : ''}>大阪</option>
						<option value="兵庫"
							${plan.place != null && plan.place.trim().replace("県", "") == '兵庫' ? 'selected' : ''}>兵庫</option>
						<option value="奈良"
							${plan.place != null && plan.place.trim().replace("県", "") == '奈良' ? 'selected' : ''}>奈良</option>
						<option value="和歌山"
							${plan.place != null && plan.place.trim().replace("県", "") == '和歌山' ? 'selected' : ''}>和歌山</option>
					</optgroup>
					<!-- 中国地方 -->
					<optgroup label="中国">
						<option value="鳥取"
							${plan.place != null && plan.place.trim().replace("県", "") == '鳥取' ? 'selected' : ''}>鳥取</option>
						<option value="島根"
							${plan.place != null && plan.place.trim().replace("県", "") == '島根' ? 'selected' : ''}>島根</option>
						<option value="岡山"
							${plan.place != null && plan.place.trim().replace("県", "") == '岡山' ? 'selected' : ''}>岡山</option>
						<option value="広島"
							${plan.place != null && plan.place.trim().replace("県", "") == '広島' ? 'selected' : ''}>広島</option>
						<option value="山口"
							${plan.place != null && plan.place.trim().replace("県", "") == '山口' ? 'selected' : ''}>山口</option>
					</optgroup>
					<!-- 四国地方 -->
					<optgroup label="四国">
						<option value="徳島"
							${plan.place != null && plan.place.trim().replace("県", "") == '徳島' ? 'selected' : ''}>徳島</option>
						<option value="香川"
							${plan.place != null && plan.place.trim().replace("県", "") == '香川' ? 'selected' : ''}>香川</option>
						<option value="愛媛"
							${plan.place != null && plan.place.trim().replace("県", "") == '愛媛' ? 'selected' : ''}>愛媛</option>
						<option value="高知"
							${plan.place != null && plan.place.trim().replace("県", "") == '高知' ? 'selected' : ''}>高知</option>
					</optgroup>
					<!-- 九州・沖縄地方 -->
					<optgroup label="九州・沖縄">
						<option value="福岡"
							${plan.place != null && plan.place.trim().replace("県", "") == '福岡' ? 'selected' : ''}>福岡</option>
						<option value="佐賀"
							${plan.place != null && plan.place.trim().replace("県", "") == '佐賀' ? 'selected' : ''}>佐賀</option>
						<option value="長崎"
							${plan.place != null && plan.place.trim().replace("県", "") == '長崎' ? 'selected' : ''}>長崎</option>
						<option value="熊本"
							${plan.place != null && plan.place.trim().replace("県", "") == '熊本' ? 'selected' : ''}>熊本</option>
						<option value="大分"
							${plan.place != null && plan.place.trim().replace("県", "") == '大分' ? 'selected' : ''}>大分</option>
						<option value="宮崎"
							${plan.place != null && plan.place.trim().replace("県", "") == '宮崎' ? 'selected' : ''}>宮崎</option>
						<option value="鹿児島"
							${plan.place != null && plan.place.trim().replace("県", "") == '鹿児島' ? 'selected' : ''}>鹿児島</option>
						<option value="沖縄"
							${plan.place != null && plan.place.trim().replace("県", "") == '沖縄' ? 'selected' : ''}>沖縄</option>
					</optgroup>
				</select>


			</div>


			<div id="scheduleContainer">
				<h3>- スケジュール -</h3>
				<!-- スポットとその情報をフォーム形式で表示 -->
				<div class="d-flex flex-column mt-3">
					<c:forEach var="scheduleItem" items="${scheduleList}"
						varStatus="status">
						<!-- スポット名とコメントフォーム -->
						<div class="schedule-item d-flex flex-row align-items-start mb-4">
							<!-- スポット名やコメントの入力フォーム -->
							<div class="d-flex flex-column w-75">
								<input type="text" name="schedulePlace[]"
									class="form-control mb-2" placeholder="スポット名"
									value="${scheduleItem['スポット名']}">
								<textarea name="scheduleComment[]" class="form-control mb-2"
									placeholder="説明やおすすめポイント">${scheduleItem['コメント']}</textarea>
							</div>

							<!-- 写真関連の処理 -->
							<div class="photo-section ms-3">
								<!-- 現在の画像を表示 -->
								<c:if test="${not empty scheduleItem['写真']}">
									<img
										src="${pageContext.request.contextPath}${scheduleItem['写真']}"
										alt="現在の写真" class="current-image"
										style="max-width: 200px; display: block; margin-bottom: 10px;">
								</c:if>

								<!-- 画像の変更用 -->
								<label for="scheduleImage">写真の追加または変更</label> <input type="file"
									name="scheduleImage[]"
									class="form-control mb-2 schedule-image-input" accept="image/*" />

								<!-- 新しい画像のプレビュー -->
								<img class="img-preview mb-2"
									style="max-width: 200px; display: none;" />
							</div>

						</div>

						<!-- 次のスポットまでの所要時間フォーム（最後の要素以外の場合のみ表示） -->
						<c:if test="${!status.last}">
							<div class="d-flex justify-content-center">
								<div class="display-5 d-flex flex-column me-0">
									<i class="bi bi-caret-down"></i> <i class="bi bi-caret-down"></i>
									<i class="bi bi-caret-down"></i>
								</div>
								<div>
									<span>次のスポットまでの所要時間</span>
									<div class="d-flex align-items-center gap-3 ms-0">
										<select name="scheduleTransport[]" class="form-select">
											<option value="">設定しない</option>
											<option value="徒歩"
												${scheduleItem['移動手段'] == '徒歩' ? 'selected' : ''}>徒歩</option>
											<option value="車"
												${scheduleItem['移動手段'] == '車' ? 'selected' : ''}>車</option>
											<option value="バス"
												${scheduleItem['移動手段'] == 'バス' ? 'selected' : ''}>バス</option>
											<option value="電車"
												${scheduleItem['移動手段'] == '電車' ? 'selected' : ''}>電車</option>
											<option value="自転車"
												${scheduleItem['移動手段'] == '自転車' ? 'selected' : ''}>自転車</option>
											<option value="フェリー"
												${scheduleItem['移動手段'] == 'フェリー' ? 'selected' : ''}>フェリー</option>
										</select> <span>:</span> <select name="hours[]" class="form-select">
											<option value="">設定しない</option>
											<c:forEach begin="1" end="10" var="hour">
												<option value="${hour}"
													${scheduleItem['時間'] != null && scheduleItem['時間'] == hour ? 'selected' : ''}>${hour}</option>
											</c:forEach>
										</select> <span style="white-space: nowrap;">時間</span> <select
											name="minutes[]" class="form-select">
											<option value="">設定しない</option>
											<option value="1"
												${scheduleItem['分'] != null && scheduleItem['分'] == 1 ? 'selected' : ''}>1</option>
											<option value="3"
												${scheduleItem['分'] != null && scheduleItem['分'] == 3 ? 'selected' : ''}>3</option>
											<c:forEach begin="5" end="55" step="5" var="minute">
												<option value="${minute}"
													${scheduleItem['分'] != null && scheduleItem['分'] == minute ? 'selected' : ''}>${minute}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>

				</div>

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
								class="form-control mb-2" placeholder="スポット名" />
							<textarea name="scheduleComment[]" class="form-control mb-2"
								placeholder="説明やおすすめポイント"></textarea>
						</div>
						<div class="photo-section ms-3">
							<input type="file" name="scheduleImage[]"
								class="form-control mb-2 schedule-image-input" accept="image/*" />
							<img class="img-preview mb-2"
								style="max-width: 200px; display: none;" />
						</div>
					</div>
					<button type="button" class="btn btn-danger ms-3 remove-button">削除</button>
				</div>
			</template>
			<!-- 項目を追加するボタン -->
			<button id="addSpotButton" type="button" class="btn btn-primary">スポットを追加</button>

			<!-- ボタン -->
			<button type="submit" class="btn btn-primary">保存</button>
			<a
				href="${not empty sessionScope.previousPage ? sessionScope.previousPage : '/defaultPage'}"
				class="btn btn-secondary">キャンセル</a>
		</div>
		<!-- 削除ボタン表示の条件 -->
		<c:if test="${plan.user.id == sessionScope.user.id}">
			<a href="deletePlan?id=<c:out value="${plan.id}" />">削除</a>
		</c:if>
	</form>
	<div>
		<p>
			<a href="<%=request.getContextPath()%>/user/top">トップに戻る </a>
		</p>
	</div>

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

	            // プレビュー画像を取得
	            const imgPreview = fileInput.closest(".schedule-item").querySelector(".img-preview");

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
