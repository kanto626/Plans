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
				<label for="title" class="form-label"><h3>タイトル</h3> <c:if
						test="${not empty titleError}">
						<div class="alert alert-danger">
							<c:out value="${titleError}" />
						</div>
					</c:if> <input type="text" id="title" name="title"
					value="<c:out value="${title}" />" class="form-control"
					placeholder="タイトルを入力">
			</div>

			<div class="container">

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

					<!-- 九州地方・沖縄 -->
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
				<%-- <label>カテゴリ:</label><br>
				<c:forEach var="category" items="${categories}">
					<input type="checkbox" name="categoryIds" value="${category.id}"
						id="category-${category.id}">
					<label for="category-${category.id}">${category.name}</label>
					<br>
				</c:forEach> --%>

			</div>

			<!-- スケジュール部分 -->
			<div>
				<h3>- スケジュール -</h3>
			</div>

			<div id="scheduleContainer">
				<!-- 既に入力済みのデータがある場合は forEach で再表示、無い場合は初期表示用1つだけ表示 -->
				<c:choose>

					<c:when test="${not empty schedulePlaces}">
						<c:forEach var="i" begin="0"
							end="${fn:length(schedulePlaces) - 1}">
							<div class="schedule-item mb-3"
								style="border: 1px solid #ccc; padding: 1rem;">

								<div class="d-flex flex-row align-items-start">
									<div class="d-flex flex-column w-75">
										<input type="text" name="schedulePlace[]"
											class="form-control mb-2" placeholder="スポット名"
											value="${fn:escapeXml(schedulePlaces[i])}" />

										<textarea name="scheduleComment[]" class="form-control mb-2"
											placeholder="説明やおすすめポイント">${fn:escapeXml(scheduleComments[i])}</textarea>
									</div>

									
									
									<div class="photo-section ms-3">
										<h5>画像の変更</h5>
										<input type="file" name="scheduleImage[]"
											class="form-control mb-2"
											onchange="previewImage(event, this)" /> <img
											class="imagePreview" src="#" alt="プレビュー画像"
											style="max-width: 300px; display: none; margin-top: 10px;">
										<c:if
											test="${not empty scheduleImages and fn:length(scheduleImages) gt i}">

											<c:if test="${not empty scheduleImages[i]}">

												<img class="old-uploaded-image"
													src="${pageContext.request.contextPath}${scheduleImages[i]}"
													alt="アップロード画像" style="max-width: 300px; margin-top: 10px;" />
											</c:if>
										</c:if>
									</div>
								</div>


								<div
									class="d-flex justify-content-center align-items-center mt-3">
									<div class="display-5 d-flex flex-column me-0">
										<i class="bi bi-caret-down"></i> <i class="bi bi-caret-down"></i>
										<i class="bi bi-caret-down"></i>
									</div>
									<div class="ms-3">
										<span>次のスポットまでの所要時間</span>
										<div class="d-flex align-items-center gap-2 ms-0">

											<select name="scheduleTransport[]" class="form-select">
												<option value=""
													<c:if test="${empty scheduleTransports[i]}">selected</c:if>>
													設定しない</option>
												<option value="徒歩"
													<c:if test="${scheduleTransports[i] == '徒歩'}">selected</c:if>>
													徒歩</option>
												<option value="車"
													<c:if test="${scheduleTransports[i] == '車'}">selected</c:if>>
													車</option>
												<option value="バス"
													<c:if test="${scheduleTransports[i] == 'バス'}">selected</c:if>>
													バス</option>
												<option value="電車"
													<c:if test="${scheduleTransports[i] == '電車'}">selected</c:if>>
													電車</option>
												<option value="自転車"
													<c:if test="${scheduleTransports[i] == '自転車'}">selected</c:if>>
													自転車</option>
												<option value="フェリー"
													<c:if test="${scheduleTransports[i] == 'フェリー'}">selected</c:if>>
													フェリー</option>
											</select> <span>:</span> <select name="hours[]" class="form-select">
												<option value=""
													<c:if test="${empty hours[i]}">selected</c:if>>
													設定しない</option>
												<option value="1"
													<c:if test="${hours[i] == '1'}">selected</c:if>>1</option>
												<option value="2"
													<c:if test="${hours[i] == '2'}">selected</c:if>>2</option>
												<option value="3"
													<c:if test="${hours[i] == '3'}">selected</c:if>>3</option>
												<option value="4"
													<c:if test="${hours[i] == '4'}">selected</c:if>>4</option>
												<option value="5"
													<c:if test="${hours[i] == '5'}">selected</c:if>>5</option>
												<option value="6"
													<c:if test="${hours[i] == '6'}">selected</c:if>>6</option>
												<option value="7"
													<c:if test="${hours[i] == '7'}">selected</c:if>>7</option>
												<option value="8"
													<c:if test="${hours[i] == '8'}">selected</c:if>>8</option>
												<option value="9"
													<c:if test="${hours[i] == '9'}">selected</c:if>>9</option>
												<option value="10"
													<c:if test="${hours[i] == '10'}">selected</c:if>>10</option>
											</select> <span>時間</span> <select name="minutes[]" class="form-select">
												<option value=""
													<c:if test="${empty minutes[i]}">selected</c:if>>
													設定しない</option>
												<option value="3"
													<c:if test="${minutes[i] == '3'}">selected</c:if>>3</option>
												<option value="5"
													<c:if test="${minutes[i] == '5'}">selected</c:if>>5</option>
												<option value="10"
													<c:if test="${minutes[i] == '10'}">selected</c:if>>10</option>
												<option value="15"
													<c:if test="${minutes[i] == '15'}">selected</c:if>>15</option>
												<option value="20"
													<c:if test="${minutes[i] == '20'}">selected</c:if>>20</option>
												<option value="25"
													<c:if test="${minutes[i] == '25'}">selected</c:if>>25</option>
												<option value="30"
													<c:if test="${minutes[i] == '30'}">selected</c:if>>30</option>
												<option value="35"
													<c:if test="${minutes[i] == '35'}">selected</c:if>>35</option>
												<option value="40"
													<c:if test="${minutes[i] == '40'}">selected</c:if>>40</option>
												<option value="45"
													<c:if test="${minutes[i] == '45'}">selected</c:if>>45</option>
												<option value="50"
													<c:if test="${minutes[i] == '50'}">selected</c:if>>50</option>
												<option value="55"
													<c:if test="${minutes[i] == '55'}">selected</c:if>>55</option>
											</select> <span>分</span>
										</div>
									</div>
								</div>



								<button class="remove-button btn btn-danger mt-2" type="button"
									onclick="removeScheduleItem(this)">このスポットを削除</button>
							</div>
						</c:forEach>
					</c:when>


					<c:otherwise>
						<div class="schedule-item mb-3"
							style="border: 1px solid #ccc; padding: 1rem;">
							<div class="d-flex flex-row align-items-start">
								<div class="d-flex flex-column w-75">
									<input type="text" name="schedulePlace[]"
										class="form-control mb-2" placeholder="スポット名" />
									<textarea name="scheduleComment[]" class="form-control mb-2"
										placeholder="説明やおすすめポイント"></textarea>
								</div>

								<div class="photo-section ms-3">
									<input type="file" name="scheduleImage[]"
										class="form-control mb-2" onchange="previewImage(event, this)" />
									<img class="imagePreview" src="#" alt="プレビュー画像"
										style="max-width: 300px; display: none; margin-top: 10px;">
								</div>
							</div>

							<div
								class="d-flex justify-content-center align-items-center mt-3">
								<div class="display-5 d-flex flex-column me-0">
									<i class="bi bi-caret-down"></i> <i class="bi bi-caret-down"></i>
									<i class="bi bi-caret-down"></i>
								</div>
								<div class="ms-3">
									<span>次のスポットまでの所要時間</span>
									<div class="d-flex align-items-center gap-2 ms-0">
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
						</div>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- テンプレート: 「スポットを追加」ボタンで複製する -->
			<template id="scheduleTemplate">
				<div class="schedule-item mb-3"
					style="border: 1px solid #ccc; padding: 1rem;">
					<div class="d-flex flex-row align-items-start">
						<div class="d-flex flex-column w-75">
							<input type="text" name="schedulePlace[]"
								class="form-control mb-2" placeholder="スポット名" />
							<textarea name="scheduleComment[]" class="form-control mb-2"
								placeholder="説明やおすすめポイント"></textarea>
						</div>

						<div class="photo-section ms-3">
							<input type="file" name="scheduleImage[]"
								class="form-control mb-2" onchange="previewImage(event, this)" />
							<img class="imagePreview" src="#" alt="プレビュー画像"
								style="max-width: 300px; display: none; margin-top: 10px;">
						</div>
					</div>

					<div class="d-flex justify-content-center align-items-center mt-3">
						<div class="display-5 d-flex flex-column me-0">
							<i class="bi bi-caret-down"></i> <i class="bi bi-caret-down"></i>
							<i class="bi bi-caret-down"></i>
						</div>
						<div class="ms-3">
							<span>次のスポットまでの所要時間</span>
							<div class="d-flex align-items-center gap-2 ms-0">
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

					<button class="remove-button btn btn-danger mt-2" type="button">
						このスポットを削除</button>
				</div>
			</template>

			<!-- スポット追加ボタン -->
			<button id="addSpotButton" type="button" class="btn btn-success">
				スポットを追加</button>
			<br /> <br />

			<!-- 登録ボタン -->
			<button type="submit" class="btn btn-primary">登録</button>
	</form>

	<div>
		<p>
			<a href="<%=request.getContextPath()%>/user/top">トップに戻る</a>
		</p>
	</div>

	<!-- プレビュー表示用JS -->
	<script>
		function previewImage(event, input) {
			const container = input.closest('.photo-section');

			// もし古いアップロード画像の <img> があれば削除する
			const oldImage = container.querySelector('.old-uploaded-image');
			if (oldImage) {
				oldImage.remove();
			}

			// 新しく選んだファイルをプレビュー表示
			if (input.files && input.files[0]) {
				const reader = new FileReader();
				reader.onload = function(e) {
					const preview = container.querySelector('.imagePreview');
					preview.src = e.target.result;
					preview.style.display = 'block';
				};
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>

	<!-- 追加・削除ボタン用JS -->
	<script>
		document.getElementById('addSpotButton').addEventListener(
				'click',
				function() {
					const container = document
							.getElementById('scheduleContainer');
					const template = document
							.getElementById('scheduleTemplate').content
							.cloneNode(true);

					// 削除ボタンのイベント設定
					template.querySelector('.remove-button').addEventListener(
							'click', function() {
								this.closest('.schedule-item').remove();
							});

					container.appendChild(template);
				});

		function removeScheduleItem(button) {
			button.closest('.schedule-item').remove();
		}
	</script>

	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</html>