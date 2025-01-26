<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<div class="container">
		<div>
			<h1>旅行プラン作成</h1>
		</div>

		<form action="" method="post" enctype="multipart/form-data">
			<!-- タイトル -->
			<div class="container">
				<label for="title" class="form-label">
					<h3>タイトル</h3> <c:if test="${not empty titleError}">
						<div class="alert alert-danger">
							<c:out value="${titleError}" />
						</div>
					</c:if> <input type="text" id="title" name="title"
					value="<c:out value='${title}' />" class="form-control"
					placeholder="タイトルを入力">
				</label>
			</div>

			<!-- 目的地 -->
			<div class="container">
				<label for="place" class="form-label"><h3>目的地</h3></label>
				<c:if test="${not empty placeError}">
					<div class="alert alert-danger">
						<c:out value="${placeError}" />
					</div>
				</c:if>
				<select name="place" id="place" class="form-select">
					<option value="">都道府県を選択</option>
					<!-- 北海道・東北グループ (例) -->
					<optgroup label="北海道・東北">
						<option value="北海道" <c:if test="${'北海道' == place}">selected</c:if>>北海道</option>
						<option value="青森県" <c:if test="${'青森県' == place}">selected</c:if>>青森県</option>
						<!-- 以下略 -->
					</optgroup>
					<!-- その他の optgroup は省略 -->
				</select>
			</div>



			<!-- スケジュール部分 -->
			<div>
				<h3>- スケジュール -</h3>
			</div>
			<div id="scheduleContainer">
				<c:if test="${not empty schedulePlacesError}">
					<div class="alert alert-danger">
						<c:out value="${schedulePlacesError}" />
					</div>
				</c:if>



				<c:choose>

					<c:when test="${not empty schedulePlaces}">

						<c:if test="${fn:length(schedulePlaces) >= 1}">
							<div class="schedule-item mb-3"
								style="border: 1px solid #ccc; padding: 1rem;">

								<div class="d-flex flex-row align-items-start">
									<div class="d-flex flex-column w-75">



										<input type="text" name="schedulePlace[]"
											class="form-control mb-2" placeholder="スポット名"
											value="${fn:escapeXml(schedulePlaces[0])}" />
										<textarea name="scheduleComment[]" class="form-control mb-2"
											placeholder="説明やおすすめポイント">
                                        <c:out
												value="${scheduleComments[0]}" />
                                    </textarea>
									</div>
									<div class="photo-section ms-3">
										<input type="file" name="scheduleImage[]"
											class="form-control mb-2"
											onchange="previewImage(event, this)" /> <img
											class="imagePreview" src="#" alt="プレビュー画像"
											style="max-width: 300px; display: none; margin-top: 10px;">

										<c:if
											test="${not empty scheduleImages and fn:length(scheduleImages) >= 1}">
											<c:if test="${not empty scheduleImages[0]}">
												<img class="old-uploaded-image"
													src="${pageContext.request.contextPath}${scheduleImages[0]}"
													alt="アップロード画像" style="max-width: 300px; margin-top: 10px;" />
											</c:if>
										</c:if>
									</div>
								</div>

							</div>
						</c:if>


						<c:if test="${fn:length(schedulePlaces) > 1}">
							<c:forEach var="i" begin="1"
								end="${fn:length(schedulePlaces) - 1}">
								<div class="schedule-item mb-3"
									style="border: 1px solid #ccc; padding: 1rem;">


									<div
										class="d-flex justify-content-center align-items-center mt-3">
										<div class="display-5 d-flex flex-column me-0">
											<i class="bi bi-caret-down"></i> <i class="bi bi-caret-down"></i>
											<i class="bi bi-caret-down"></i>
										</div>
										<div class="ms-3">
											<span>次のスポットまでの所要時間</span>
											<c:if test="${not empty scheduleTransportsError}">
												<div class="alert alert-danger">
													<c:out value="${scheduleTransportsError}" />
												</div>
											</c:if>
											<div class="d-flex align-items-center gap-2 ms-0">
												<select name="scheduleTransport[]" class="form-select">
													<option value=""
														<c:if test="${empty scheduleTransports[i]}">selected</c:if>>設定しない</option>
													<option value="徒歩"
														<c:if test="${scheduleTransports[i] == '徒歩'}">selected</c:if>>徒歩</option>
													<option value="車"
														<c:if test="${scheduleTransports[i] == '車'}">selected</c:if>>車</option>
													<option value="バス"
														<c:if test="${scheduleTransports[i] == 'バス'}">selected</c:if>>バス</option>
													<option value="電車"
														<c:if test="${scheduleTransports[i] == '電車'}">selected</c:if>>電車</option>
													<option value="自転車"
														<c:if test="${scheduleTransports[i] == '自転車'}">selected</c:if>>自転車</option>
													<option value="フェリー"
														<c:if test="${scheduleTransports[i] == 'フェリー'}">selected</c:if>>フェリー</option>
												</select> <span>:</span> <select name="hours[]" class="form-select">
													<option value=""
														<c:if test="${empty hours[i]}">selected</c:if>>設定しない</option>
													<option value="1"
														<c:if test="${hours[i] == '1'}">selected</c:if>>1</option>
													<option value="2"
														<c:if test="${hours[i] == '2'}">selected</c:if>>2</option>
													<option value="3"
														<c:if test="${hours[i] == '3'}">selected</c:if>>3</option>
													<!-- 必要に応じて拡張 -->
												</select> <span>時間</span> <select name="minutes[]"
													class="form-select">
													<option value=""
														<c:if test="${empty minutes[i]}">selected</c:if>>設定しない</option>
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
													<!-- 以下略 -->
												</select> <span>分</span>
											</div>
										</div>
									</div>


									<div class="d-flex flex-row align-items-start mt-3">
										<div class="d-flex flex-column w-75">
											<input type="text" name="schedulePlace[]"
												class="form-control mb-2" placeholder="スポット名"
												value="${fn:escapeXml(schedulePlaces[i])}" />
											<textarea name="scheduleComment[]" class="form-control mb-2"
												placeholder="説明やおすすめポイント">${fn:escapeXml(scheduleComments[i])}</textarea>
										</div>

										<div class="photo-section ms-3">

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


									<button class="remove-button btn btn-danger mt-2" type="button"
										onclick="removeScheduleItem(this)">このスポットを削除</button>
								</div>
							</c:forEach>
						</c:if>

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

						</div>
					</c:otherwise>
				</c:choose>

			</div>
			<!-- /#scheduleContainer -->

			<!-- ▼ テンプレート: 「スポットを追加」ボタンで複製するときの構造 (所要時間 → スポット名/画像 → 削除ボタン) -->
			<template id="scheduleTemplate">
				<div class="schedule-item mb-3"
					style="border: 1px solid #ccc; padding: 1rem;">

					<!-- (1) 移動手段 + 所要時間 -->
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
									<!-- 必要に応じて追加 -->
								</select> <span>時間</span> <select name="minutes[]" class="form-select">
									<option value="">設定しない</option>
									<option value="3">3</option>
									<option value="5">5</option>
									<option value="10">10</option>
									<!-- 必要に応じて追加 -->
								</select> <span>分</span>
							</div>
						</div>
					</div>

					<!-- (2) スポット名/コメント/画像 (下に配置) -->
					<div class="d-flex flex-row align-items-start mt-3">
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

					<!-- (3) 削除ボタン -->
					<button class="remove-button btn btn-danger mt-2" type="button">
						このスポットを削除</button>
				</div>
			</template>

			<!-- スポット追加ボタン -->
			<button id="addSpotButton" type="button" class="btn btn-success">
				スポットを追加</button>

			<br> <br>
			<!-- 登録ボタン -->
			<button type="submit" class="btn btn-primary">登録</button>
		</form>
	</div>
	<!-- /.container -->

	<div>
		<p>
			<a href="<%=request.getContextPath()%>/user/top">トップに戻る</a>
		</p>
	</div>

	<!-- ========== JavaScript ========== -->
	<script>
		function previewImage(event, input) {
			const container = input.closest('.photo-section');
			// 古い画像があれば削除
			const oldImage = container.querySelector('.old-uploaded-image');
			if (oldImage) {
				oldImage.remove();
			}

			// 新しいファイルをプレビュー表示
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

		// 「スポットを追加」ボタン → テンプレートを複製
		document.getElementById('addSpotButton').addEventListener(
				'click',
				function() {
					const container = document
							.getElementById('scheduleContainer');
					const template = document
							.getElementById('scheduleTemplate').content
							.cloneNode(true);

					// 削除ボタンにイベント付与
					template.querySelector('.remove-button').addEventListener(
							'click', function() {
								this.closest('.schedule-item').remove();
							});

					container.appendChild(template);
				});

		// 再表示フォーム (i>=1) 用: removeScheduleItem
		function removeScheduleItem(button) {
			button.closest('.schedule-item').remove();
		}
	</script>

	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</html>