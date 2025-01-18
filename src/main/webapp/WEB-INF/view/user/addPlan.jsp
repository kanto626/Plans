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

body {
	text-align: center;
	background-color: #f9f9f9;
}
</style>
</head>
<body>
	<div class="container">
		<h1>旅行プラン作成</h1>
		<form action="" method="post" class="">
			<!-- 基本情報 -->
			<div class="container">

				<div class="container">
					<h3 label for="title" class="form-label">タイトル</h3>
					<input type="text" id="title" name="title" class="form-control"
						placeholder="タイトルを入力">
				</div>

				<div class="container">

					<label for="place" class="form-label">目的地 : </label> <select
						name="place" id="place">
						<option value="北海道">北海道</option>
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
							</label>

						</div>
					</fieldset>
				</div>

				<div id="scheduleContainer">

					<h3 class="">- スケジュール -</h3>

					<!-- スポット入力欄の初期表示 -->
					<div class="d-flex flex-row align-items-start mt-3">
						<!-- スポット、コメントエリア、スポット間アイコンを縦に並べる -->
						<div class="d-flex flex-column w-75">
							<!-- スポット名入力 -->
							<input type="text" name="schedulePlace[]"
								class="form-control mb-2" placeholder="スポット名">

							<!-- コメントエリア -->
							<textarea name="scheduleComment[]" class="form-control mb-2"
								placeholder="説明やおすすめポイント"></textarea>
						</div>


						<!-- 写真を追加ボタン: 右側に配置 -->
						<div class="photo-section ms-3">
							<input type="text" name="scheduleImage[]"
								class="form-control mb-2" placeholder="写真の追加">
						</div>
					</div>

					<div class="d-flex justify-content-center">
						<div>
							<!-- アイコン部分 -->
							<div class="display-5 d-flex flex-column me-0">
								<!-- me-0 で右側の余白をゼロに設定 -->
								<i class="bi bi-caret-down"></i> <i class="bi bi-caret-down"></i>
								<i class="bi bi-caret-down"></i>
							</div>
						</div>
						<div>
							<!-- 次のスポットまでの所要時間のフォーム部分 -->
							<div class="container ms-0">
								<span>次のスポットまでの所要時間</span>
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
									</select> <span style="white-space: nowrap;">時間</span>

									<!-- Minute Selection -->
									<select id="minuteSelect" name="minutes[]" class="form-select">
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
						</div>


						<!-- 写真を追加ボタン: 右側に配置 -->
						<div class="photo-section ms-3">
							<input type="text" name="scheduleImage[]"
								class="form-control mb-2" placeholder="写真の追加">
						</div>
					</div>
				</div>
				<!-- 追加用のボタン -->
				<button type="button" id="addSpotButton" class="btn btn-secondary">スポットを追加</button>
			</div>

			<button type="submit" class="btn btn-primary">登録</button>
	</div>
	</form>
	</div>
	<p>
		<a href="<%=request.getContextPath()%>/user/top">トップに戻る </a>
	</p>
	</div>
	<script>
            document.getElementById('addSpotButton').addEventListener('click', function () {
                // 追加するHTMLのテンプレート
                const newSpotHTML = `
       <div class="d-flex justify-content-center">
                            <div> <!-- アイコン部分 -->
                                <div class="display-5 d-flex flex-column me-0"> <!-- me-0 で右側の余白をゼロに設定 -->
                                    <i class="bi bi-caret-down"></i>
                                    <i class="bi bi-caret-down"></i>
                                    <i class="bi bi-caret-down"></i>
                                </div>
                            </div>
                            <div><!-- 次のスポットまでの所要時間のフォーム部分 -->
                                <div class="container ms-0">
                                    <span>次のスポットまでの所要時間</span>
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
                                        </select>
                                        <span>:</span>

                                        <select id="hourSelect" name="hours[]" class="form-select">
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
                                        </select>
                                        <span style="white-space: nowrap;">時間</span>

                                        <!-- Minute Selection -->
                                        <select id="minuteSelect" name="minutes[]" class="form-select">
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
                                        </select>
                                        <span>分</span>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- スポット入力欄の初期表示 -->
                        <div id="scheduleContainer" class="d-flex flex-row align-items-start mt-3">
                            <!-- スポット、コメントエリア、スポット間アイコンを縦に並べる -->
                            <div class="d-flex flex-column w-75">
                                <!-- スポット名入力 -->
                                <input type="text" name="schedulePlace[]" class="form-control mb-2" placeholder="スポット名">

                                <!-- コメントエリア -->
                                <textarea name="scheduleComment[]" class="form-control mb-2"
                                    placeholder="説明やおすすめポイント"></textarea>
                            </div>


                            <!-- 写真を追加ボタン: 右側に配置 -->
                            <div class="photo-section ms-3">
                                <input type="text" name="scheduleImage[]" class="form-control mb-2" placeholder="写真の追加">
                            </div>
                        </div>
                    </div>
    `;

                // 挿入先コンテナを取得
                const scheduleContainer = document.getElementById('scheduleContainer');

                // 新しいスポットを挿入
                scheduleContainer.insertAdjacentHTML('beforeend', newSpotHTML);
            });
        </script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</html>
