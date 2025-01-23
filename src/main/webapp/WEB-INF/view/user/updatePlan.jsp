<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>updatePlan</title>
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
	<form action="" method="post">
		<table border="1">
			<tr>
				<th>タイトル</th>
				<td><c:if test="${not empty titleError}">
						<p>
							<c:out value="※${titleError}" />
						</p>
					</c:if> <input type="text" name="title" value="<c:out value="${title}" />">
				</td>
			</tr>
			<c:out value="${place}" />
			<tr>
				<th>場所</th>
				<td><select name="place">
						<!-- 北海道・東北地方 -->
						<optgroup label="北海道・東北">
							<option value="北海道"
								${place.trim().replace("県", "") == '北海道' ? 'selected' : ''}>北海道</option>
							<option value="青森"
								${place.trim().replace("県", "") == '青森' ? 'selected' : ''}>青森</option>
							<option value="岩手"
								${place.trim().replace("県", "") == '岩手' ? 'selected' : ''}>岩手</option>
							<option value="宮城"
								${place.trim().replace("県", "") == '宮城' ? 'selected' : ''}>宮城</option>
							<option value="秋田"
								${place.trim().replace("県", "") == '秋田' ? 'selected' : ''}>秋田</option>
							<option value="山形"
								${place.trim().replace("県", "") == '山形' ? 'selected' : ''}>山形</option>
							<option value="福島"
								${place.trim().replace("県", "") == '福島' ? 'selected' : ''}>福島</option>
						</optgroup>
						<!-- 関東地方 -->
						<optgroup label="関東">
							<option value="東京"
								${place.trim().replace("県", "") == '東京' ? 'selected' : ''}>東京</option>
							<option value="神奈川"
								${place.trim().replace("県", "") == '神奈川' ? 'selected' : ''}>神奈川</option>
							<option value="千葉"
								${place.trim().replace("県", "") == '千葉' ? 'selected' : ''}>千葉</option>
							<option value="埼玉"
								${place.trim().replace("県", "") == '埼玉' ? 'selected' : ''}>埼玉</option>
							<option value="茨城"
								${place.trim().replace("県", "") == '茨城' ? 'selected' : ''}>茨城</option>
							<option value="栃木"
								${place.trim().replace("県", "") == '栃木' ? 'selected' : ''}>栃木</option>
							<option value="群馬"
								${place.trim().replace("県", "") == '群馬' ? 'selected' : ''}>群馬</option>
							<option value="山梨"
								${place.trim().replace("県", "") == '山梨' ? 'selected' : ''}>山梨</option>
							<option value="長野"
								${place.trim().replace("県", "") == '長野' ? 'selected' : ''}>長野</option
							</option>
						</optgroup>
						<!-- 中部地方 -->
						<optgroup label="中部">
							<option value="岐阜"
								${place.trim().replace("県", "") == '岐阜' ? 'selected' : ''}>岐阜</option>
							<option value="静岡"
								${place.trim().replace("県", "") == '静岡' ? 'selected' : ''}>静岡</option>
							<option value="愛知"
								${place.trim().replace("県", "") == '愛知' ? 'selected' : ''}>愛知</option>
							<option value="三重"
								${place.trim().replace("県", "") == '三重' ? 'selected' : ''}>三重</option>
						</optgroup>
						<!-- 関西地方 -->
						<optgroup label="関西">
							<option value="滋賀"
								${place.trim().replace("県", "") == '滋賀' ? 'selected' : ''}>滋賀</option>
							<option value="京都"
								${place.trim().replace("県", "") == '京都' ? 'selected' : ''}>京都</option>
							<option value="大阪"
								${place.trim().replace("県", "") == '大阪' ? 'selected' : ''}>大阪</option>
							<option value="兵庫"
								${place.trim().replace("県", "") == '兵庫' ? 'selected' : ''}>兵庫</option>
							<option value="奈良"
								${place.trim().replace("県", "") == '奈良' ? 'selected' : ''}>奈良</option>
							<option value="和歌山"
								${place.trim().replace("県", "") == '和歌山' ? 'selected' : ''}>和歌山</option>
						</optgroup>
						<!-- 中国地方 -->
						<optgroup label="中国">
							<option value="鳥取"
								${place.trim().replace("県", "") == '鳥取' ? 'selected' : ''}>鳥取</option>
							<option value="島根"
								${place.trim().replace("県", "") == '島根' ? 'selected' : ''}>島根</option>
							<option value="岡山"
								${place.trim().replace("県", "") == '岡山' ? 'selected' : ''}>岡山</option>
							<option value="広島"
								${place.trim().replace("県", "") == '広島' ? 'selected' : ''}>広島</option>
							<option value="山口"
								${place.trim().replace("県", "") == '山口' ? 'selected' : ''}>山口</option>
						</optgroup>
						<!-- 四国地方 -->
						<optgroup label="四国">
							<option value="徳島"
								${place.trim().replace("県", "") == '徳島' ? 'selected' : ''}>徳島</option>
							<option value="香川"
								${place.trim().replace("県", "") == '香川' ? 'selected' : ''}>香川</option>
							<option value="愛媛"
								${place.trim().replace("県", "") == '愛媛' ? 'selected' : ''}>愛媛</option>
							<option value="高知"
								${place.trim().replace("県", "") == '高知' ? 'selected' : ''}>高知</option>
						</optgroup>
						<!-- 九州地方 -->
						<optgroup label="九州・沖縄">
							<option value="福岡"
								${place.trim().replace("県", "") == '福岡' ? 'selected' : ''}>福岡</option>
							<option value="佐賀"
								${place.trim().replace("県", "") == '佐賀' ? 'selected' : ''}>佐賀</option>
							<option value="長崎"
								${place.trim().replace("県", "") == '長崎' ? 'selected' : ''}>長崎</option>
							<option value="熊本"
								${place.trim().replace("県", "") == '熊本' ? 'selected' : ''}>熊本</option>
							<option value="大分"
								${place.trim().replace("県", "") == '大分' ? 'selected' : ''}>大分</option>
							<option value="宮崎"
								${place.trim().replace("県", "") == '宮崎' ? 'selected' : ''}>宮崎</option>
							<option value="鹿児島"
								${place.trim().replace("県", "") == '鹿児島' ? 'selected' : ''}>鹿児島</option>
							<option value="沖縄"
								${place.trim().replace("県", "") == '沖縄' ? 'selected' : ''}>沖縄</option>
						</optgroup>
				</select></td>
			</tr>

		</table>
		<table border="1">
			<tr>
				<th>カテゴリー</th>
				<td><c:if test="${not empty allCategories}">
						<c:forEach var="category" items="${allCategories}">
							<label> <input type="checkbox" name="categories"
								value="${category.id}"
								<c:if test="${category.selected}">checked</c:if> />
								${category.name}
							</label>
							<br />
						</c:forEach>
					</c:if></td>
			</tr>
			<th>スケジュール</th>
			<td><c:if test="${not empty scheduleList}">
					<c:forEach var="schedule" items="${scheduleList}"
						varStatus="status">
						<div>
							<c:forEach var="entry" items="${schedule}">
								<label> ${entry.key}: <c:choose>
										<c:when test="${entry.key == 'transport'}">
											<!-- Transportの場合はドロップダウンリスト -->
											<select name="schedule[${status.index}][${entry.key}]"
												class="form-select">
												<option value="">設定しない</option>
												<option value="徒歩"
													<c:if test="${entry.value == '徒歩'}">selected</c:if>>徒歩</option>
												<option value="自転車"
													<c:if test="${entry.value == '自転車'}">selected</c:if>>自転車</option>
												<option value="車"
													<c:if test="${entry.value == '車'}">selected</c:if>>車</option>
												<option value="バス"
													<c:if test="${entry.value == 'バス'}">selected</c:if>>バス</option>
												<option value="電車"
													<c:if test="${entry.value == '電車'}">selected</c:if>>電車</option>
												<option value="新幹線"
													<c:if test="${entry.value == '新幹線'}">selected</c:if>>新幹線</option>
												<option value="フェリー"
													<c:if test="${entry.value == 'フェリー'}">selected</c:if>>フェリー</option>
												<option value="飛行機"
													<c:if test="${entry.value == '飛行機'}">selected</c:if>>飛行機</option>
											</select>
										</c:when>
										<c:when test="${entry.key == '写真'}">
											<!-- 画像の場合は、画像を表示 -->
											<img src="${pageContext.request.contextPath}${entry.value}" alt="スポット画像"
												class="img-thumbnail" />
										</c:when>
										<c:when test="${entry.key == 'hours'}">
											<!-- 時間の場合はドロップダウンリスト -->
											<select name="schedule[${status.index}][${entry.key}]"
												class="form-select">
												<option value="">0</option>
												<option value="1"
													<c:if test="${entry.value == '1'}">selected</c:if>>1</option>
												<option value="2"
													<c:if test="${entry.value == '2'}">selected</c:if>>2</option>
												<option value="3"
													<c:if test="${entry.value == '3'}">selected</c:if>>3</option>
												<option value="4"
													<c:if test="${entry.value == '4'}">selected</c:if>>4</option>
												<option value="5"
													<c:if test="${entry.value == '5'}">selected</c:if>>5</option>
												<option value="6"
													<c:if test="${entry.value == '6'}">selected</c:if>>6</option>
												<option value="7"
													<c:if test="${entry.value == '7'}">selected</c:if>>7</option>
												<option value="8"
													<c:if test="${entry.value == '8'}">selected</c:if>>8</option>
												<option value="9"
													<c:if test="${entry.value == '9'}">selected</c:if>>9</option>
												<option value="10"
													<c:if test="${entry.value == '10'}">selected</c:if>>10</option>
											</select>
										</c:when>
										<c:when test="${entry.key == 'minutes'}">
											<!-- 分の場合はドロップダウンリスト -->
											<select name="schedule[${status.index}][${entry.key}]"
												class="form-select">
												<option value="">0</option>
												<option value="3"
													<c:if test="${entry.value == '3'}">selected</c:if>>3</option>
												<option value="5"
													<c:if test="${entry.value == '5'}">selected</c:if>>5</option>
												<option value="10"
													<c:if test="${entry.value == '10'}">selected</c:if>>10</option>
												<option value="15"
													<c:if test="${entry.value == '15'}">selected</c:if>>15</option>
												<option value="20"
													<c:if test="${entry.value == '20'}">selected</c:if>>20</option>
												<option value="25"
													<c:if test="${entry.value == '25'}">selected</c:if>>25</option>
												<option value="30"
													<c:if test="${entry.value == '30'}">selected</c:if>>30</option>
												<option value="35"
													<c:if test="${entry.value == '35'}">selected</c:if>>35</option>
												<option value="40"
													<c:if test="${entry.value == '40'}">selected</c:if>>40</option>
												<option value="45"
													<c:if test="${entry.value == '45'}">selected</c:if>>45</option>
												<option value="50"
													<c:if test="${entry.value == '50'}">selected</c:if>>50</option>
												<option value="55"
													<c:if test="${entry.value == '55'}">selected</c:if>>55</option>
											</select>
										</c:when>
										<c:otherwise>
											<!-- その他の入力項目はテキストフィールド -->
											<input type="text"
												name="schedule[${status.index}][${entry.key}]"
												value="${entry.value}" class="form-control" />
										</c:otherwise>
									</c:choose>
								</label>
								<br />
							</c:forEach>
						</div>
					</c:forEach>
				</c:if></td>

		</table>
		<p>
			<input type="submit" value="更新">
		</p>

	</form>

	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>

</html>
