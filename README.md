# 風呂魂
<img width="1670" alt="トップビュー" src="https://user-images.githubusercontent.com/59913169/111071974-eeaf2900-851b-11eb-94fb-bf088d86aac1.png">

# 概要
風呂好きのための、温泉・銭湯を位置情報付きで投稿できるサービスです。

# URL
http://furotama.com/<br>
画面中央の**お試し入場**からゲストログイン出来ます。<br>
<br>
※以下、リンク先<br>
[使用技術・環境](#使用技術・環境)<br>
[AWS構成図](#AWS構成図)<br>
[ER図](#ER図)<br>
[機能一覧](#機能一覧)<br>
[工夫した箇所](#工夫した箇所)<br>
[制作背景](#制作背景)<br>
[デザイン](#デザイン一覧)

# 使用技術・環境
- フロントエンド
  - Haml/SCSS
  - javaScript
  - jQuery
- バックエンド
  - Ruby 2.6.5
  - Rails 6.1.3
- DB
  - MySQL 5.7
- 開発環境
  - Docker/docker-compose
  - CircleCI（Rspec自動テスト化）
  - Git,GitHub
- 本番環境
  - AWS（VPC, EC2, RDS, S3, Route53）
  - Nginx
  - Unicorn
  - Capistrano（自動デプロイ）
- その他技術
  - レスポンシブデザイン対応
  - Google Cloud Platform
  - Rspec

# AWS構成図
<div align="center">
<img width="1014" alt="AWS" src="https://user-images.githubusercontent.com/59913169/111087406-ca2b6f00-8564-11eb-868c-9c832c53e66f.png">
</div>

# ER図
<div align="center">
<img width="1014" alt="ER" src="https://user-images.githubusercontent.com/59913169/111078642-d948f780-8539-11eb-90b5-309c8bddc35e.png">
</div>

# 機能一覧
- 認証機能
  - サインイン・サインアップ（devise）
  - ゲストログイン機能（アカウント削除、プロフィール編集不可）
  - パスワード再発行（mailer）
- ユーザー機能
  - 編集機能
    - ユーザー名、Email、パスワード、紹介文、アイコンの編集が可能
  - 削除機能
  - マイページ表示
- 管理人機能（admin）
  - 他のユーザー及び投稿の管理（編集・削除）
- 投稿機能
  - 新規投稿ページ
    - **画像プレビュー機能**
    - **画像複数枚投稿**（carrierwave）
    - 座標自動取得（geocoder）
  - 投稿編集機能
    - 投稿編集ボタンの設定（ログイン済み投稿者のみ表示）
  - 投稿削除
    - 投稿削除ボタンの設定（ログイン済み投稿者のみ表示）
    - 削除前に確認
  - 位置情報表示機能（Geocoding API、Maps Javascript API）
- コメント機能（Ajaxでの非同期通信）
  - コメント削除（ログイン済み投稿者のみ表示）
- いいね機能（Ajaxでの非同期通信）
  - 登録・解除の即時反映
- 検索機能
  - カテゴリー検索
    - チェックボックス形式で該当カテゴリーを表示
  - キーワード検索
    - 入力したキーワードを投稿内容からサーチ
  - **GoogleMap上でランダム検索（ダーツの旅風）**
- 通知機能
  - コメント、いいね時に通知
  - アクションしたユーザー及びアクションされた投稿へのリンク設置
  - ページネーション機能（kaminari）
- フォロー機能
  - フォロー、フォロワーの一覧表示
  - ページネーション機能（kaminari）
- 全面レスポンシブ化
  - サイドバーの有無のデフォルトを差別化
  - 下部投稿ボタンの有無
  - 投稿詳細ページの画像表示枚数を差別化

# 工夫した箇所
- フロントエンド
  - なるべくシンプルなUI/UXデザイン
  - 使用する色を限定し、全体の統一感を意識
  - 和風をテーマにした為、木目の背景画像やフォントをデザインに取り入れた
  - アイコンも風呂関連のものを使用
  - レスポンシブ時の利便性を考慮した配置
  - モジュールバンドラーにwebpackを使用（やってみたかった）
- バックエンド
  - GCPを導入し、機能を増やした
  - **N+1問題を意識し”includesメソッド”でSQLの処理を軽量化**
  - **画像プレビュー表示と複数枚投稿の実装**
  - 管理を簡便化するために管理者画面を実装
- 技術
  - **トレンドを調査し、情報ソースが豊富なものを選択し導入**
    - Docker・AWS・Capistrano・CircleCI

# 制作背景
私自身が風呂が好きで友人と温泉や銭湯によく行きます。<br>
仕事で京都へ行った際に、泊まった宿舎の近場で銭湯を探しました。<br>
Googleマップで見つけた銭湯は、番台があって番頭さんが座っている古風で味のある湯屋で、<br>
偶然見つけたにしてはとても感動的だったと同時に、<br>
「京都　銭湯　おすすめ」と検索しても、ヒットしない事が歯痒い思いでした。<br>
<br>
そこで、風呂好きが自由に湯屋を投稿できるサービスを作れば、<br>
ランキング形式では見つけられない、隠れた秘湯や銭湯を共有出来ると考えました。<br>

# デザイン一覧
#### 投稿一覧画面
<img width="1665" alt="投稿一覧" src="https://user-images.githubusercontent.com/59913169/111077733-866d4100-8535-11eb-9fcf-e1f234151893.png">

#### ダーツ検索画面（投稿ランダム表示）
<img width="1665" alt="ダーツ検索" src="https://user-images.githubusercontent.com/59913169/111071689-a6dbd200-851a-11eb-89ba-fe051c4fb307.png">

#### お知らせ画面
<img width="1665" alt="お知らせページ" src="https://user-images.githubusercontent.com/59913169/111076645-83238680-8530-11eb-8626-327f644f3814.png">

#### レスポンシブ一覧
<div align="center">
<img width="330"　title="スマホtop" alt="スマホtop" src="https://user-images.githubusercontent.com/59913169/111074601-0b9d2980-8527-11eb-8681-d3ba036d5c01.png">
<img width="330"　title="スマホ投稿詳細" alt="スマホ投稿詳細" src="https://user-images.githubusercontent.com/59913169/111072093-6e3cf800-851c-11eb-9d91-246b37a662ad.png">
<img width="330"　title="スマホ新規投稿" alt="スマホ新規投稿" src="https://user-images.githubusercontent.com/59913169/111074170-1656bf00-8525-11eb-830d-040dc7c9099f.png">
</div>

# 今後の実装予定
詳細は[issues](https://github.com/kushikushi5969/furotama2/issues)に記載しております。

## リンク先
・[TOP](#風呂魂)　・[URL](#URL)　・[使用技術・環境](#使用技術・環境)　・[AWS構成図](#AWS構成図)　・[ER図](#ER図)<br>
・[機能一覧](#機能一覧)　・[工夫した箇所](#工夫した箇所)　・[制作背景](#制作背景)　・[デザイン](#デザイン一覧)
