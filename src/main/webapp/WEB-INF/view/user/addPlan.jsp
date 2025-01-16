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

</head>
<body>
	<div class="container">
		<h1>旅行プラン作成</h1>
		<form action="" method="post" class="">
			<!-- 基本情報 -->
			<div class="container">

				<div class="mb-3">
					<h3 label for="title" class="form-label">タイトル</h3>
					<input type="text" id="title" name="title" class="form-control"
						placeholder="タイトルを入力">
				</div>

				<div class="container">

					<label for="place" class="form-label">目的地 : </label> <select
						name="place" id="place">
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
				</div>

				<div class="container">

					<label class="form-label">カテゴリを選択 :</label>

					<!-- 目的 -->
					<fieldset>
						<legend>目的</legend>
						<div class="checkbox-group">
							<label> <input type="checkbox" name="category"
								value="食べ歩き"> 食べ歩き
							</label> <label> <input type="checkbox" name="category"
								value="カフェ"> カフェ巡り
							</label> <label> <input type="checkbox" name="category"
								value="ショッピング"> ショッピング
							</label> <label> <input type="checkbox" name="category"
								value="運動"> 運動
							</label> <label> <input type="checkbox" name="category"
								value="スポーツ"> スポーツ
							</label> <label> <input type="checkbox" name="category"
								value="温泉"> 温泉
							</label> <label> <input type="checkbox" name="category"
								value="動物園"> 動物園
							</label> <label> <input type="checkbox" name="category"
								value="水族館"> 水族館
							</label> <label> <input type="checkbox" name="category"
								value="遊園地"> 遊園地
							</label> <label> <input type="checkbox" name="category"
								value="鑑賞"> 鑑賞
							</label> <label> <input type="checkbox" name="category"
								value="美術館巡り"> 美術館巡り
							</label> <label> <input type="checkbox" name="category"
								value="歴史巡り"> 歴史巡り
							</label> <label> <input type="checkbox" name="category"
								value="ビーチ"> ビーチ
							</label> <label> <input type="checkbox" name="category"
								value="自然散策"> 自然散策
							</label> <label> <input type="checkbox" name="category"
								value="スパ"> スパ
							</label>
						</div>
					</fieldset>

					<!-- その他 -->
					<fieldset>
						<legend>その他</legend>
						<div class="checkbox-group">
							<label> <input type="checkbox" name="category" value="観光">
								観光
							</label> <label> <input type="checkbox" name="category"
								value="リラックス"> リラックス
							</label> <label> <input type="checkbox" name="category"
								value="アクティブ"> アクティブ
							</label> <label> <input type="checkbox" name="category"
								value="ファミリー向け"> ファミリー向け
							</label> <label> <input type="checkbox" name="category"
								value="カップル向け"> カップル向け
							</label> <label> <input type="checkbox" name="category"
								value="一人旅"> 一人旅
							</label> <label> <input type="checkbox" name="category"
								value="グループ向け"> グループ向け
							</label>
						</div>
					</fieldset>



				</div>
				<h3 class="mt-4">- スケジュール -</h3>

				<!-- スポット入力欄の初期表示 -->
				<div id="scheduleContainer"
					class="d-flex flex-row align-items-start mt-3">
					<!-- スポット、コメントエリア、スポット間アイコンを縦に並べる -->
					<div class="d-flex flex-column w-75">
						<!-- スポット名入力 -->
						<input type="text" name="schedulePlace[]"
							class="form-control mb-2" placeholder="スポット名">

						<!-- コメントエリア -->
						<textarea name="scheduleComment[]" class="form-control mb-2"
							placeholder="説明やおすすめポイント"></textarea>

						<!-- スポット間のアイコンと選択項目 -->
						<div class="d-flex align-items-center">
							<div class="display-6 d-flex flex-column me-3">
								<i class="bi bi-caret-down"></i> <i class="bi bi-caret-down"></i>
								<i class="bi bi-caret-down"></i>
							</div>
							<div class="container">
								<select name="scheduleTransport[]">
									<option value="徒歩">徒歩</option>
									<option value="自転車">自転車</option>
									<option value="車">車</option>
									<option value="バス">バス</option>
									<option value="電車">電車</option>
								</select>
								<!-- アイコンが入ったドロップダウンメニュー
                                <div class="dropdown me-3">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    徒歩
                                </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <li><a class="dropdown-item" href="#" data-value="徒歩" data-icon="bi-person-walking">
                                    徒歩</a></li>
                                    <li><a class="dropdown-item" href="#" data-value="自転車" data-icon="bi-bicycle">
                                        自転車</a></li>
                                        <li><a class="dropdown-item" href="#" data-value="車" data-icon="bi-car-front-fill">
                                            車</a></li>
                                            <li><a class="dropdown-item" href="#" data-value="バス" data-icon="bi-bus-front">
                                                バス</a></li>
                                                <li><a class="dropdown-item" href="#" data-value="電車" data-icon="bi-train-front-fill">
                                                    <i class="bi bi-train-front-fill"></i> 電車</a></li>
                                                </ul>
                                            </div>
                                            -->

								<!--   
<input type="text" name="scheduleTime[]" class="form-control mb-2" placeholder="時間 (例: 10:00)">
                                          -->

								<label for="hourSelect"></label> <select id="hourSelect"
									name="hours" class="form-select">
									<option value="0">0</option>
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
									<option value="11">11</option>
									<option value="12">12</option>
								</select> 時間 <label for="minuteSelect"></label> <select
									id="minuteSelect" name="minutes" class="form-select">
									<option value="0">0</option>
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
								</select> 分
							</div>
						</div>
					</div>

					<!-- 写真を追加ボタン: 右側に配置 -->
					<div class="photo-section ms-3">
						<input type="text" name="scheduleImage[]"
							class="form-control mb-2" placeholder="写真のURL">
					</div>

				</div>
				<button type="submit" class="btn btn-primary">登録</button>
		</form>
	</div>
	<p>
		<a href="<%=request.getContextPath()%>/user/top">トップに戻る </a>
	</p>
	</div>
	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</body>
</html>
