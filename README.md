# 風呂魂
風呂好きのための、温泉・銭湯を位置情報付きで投稿できるサービスです。<br>
<img width="844" alt="トップビュー" src="https://user-images.githubusercontent.com/59913169/111071974-eeaf2900-851b-11eb-94fb-bf088d86aac1.png">

## URL
http://furotama.com/<br>
画面中央のお試し入場からゲストログイン出来ます。

# 使用技術・環境
⚪︎フロントエンド<br>
  ・Haml/SCSS<br>
  ・javaScript<br>
  ・jQuery<br>
⚪︎バックエンド<br>
  ・Ruby 2.6.5<br>
  ・Rails 6.1.3<br>
⚪︎DB<br>
  ・MySQL 5.7<br>
⚪︎開発環境<br>
  ・Docker/docker-compose<br>
  ・CircleCI（Rspec自動テスト化）<br>
  ・Git,GitHub<br>
⚪︎本番環境<br>
  ・AWS（VPC, EC2, RDS, S3, Route53）<br>
  ・Nginx<br>
  ・Unicorn<br>
  ・Capistrano（自動デプロイ）<br>
⚪︎その他技術<br>
  ・レスポンシブデザイン対応<br>
  ・Google Cloud Platform<br>
  ・Rspec<br>
# 機能一覧



# 制作背景
私自身が風呂が好きで友人と温泉や銭湯によく行きます。<br>
仕事で京都へ行った際に、泊まった宿舎の近場で銭湯を探しました。<br>
Googleマップで見つけた銭湯は、番台があって番頭さんが座っている古風で味のある湯屋で、<br>
偶然見つけたにしてはとても感動的だったと同時に、<br>
「京都　銭湯　おすすめ」と検索しても、ヒットしない事が歯痒い思いでした。<br>
<br>
そこで、風呂好きが自由に湯屋を投稿できるサービスを作れば、<br>
ランキング形式では見つけられない、隠れた秘湯や銭湯を共有出来ると考えました。<br>

# デザイン
・ダーツ検索画面（投稿ランダム表示）
<img width="1673" alt="ダーツ検索" src="https://user-images.githubusercontent.com/59913169/111071689-a6dbd200-851a-11eb-89ba-fe051c4fb307.png"><br>
・レスポンシブ一覧<br>
<img width="330" alt="スマホtop" src="https://user-images.githubusercontent.com/59913169/111074139-017a2b80-8525-11eb-99b6-5d38aaeae0e1.png">
<img width="330" alt="スマホビュー" src="https://user-images.githubusercontent.com/59913169/111072093-6e3cf800-851c-11eb-9d91-246b37a662ad.png">
<img width="330" alt="スマホ投稿" src="https://user-images.githubusercontent.com/59913169/111074170-1656bf00-8525-11eb-830d-040dc7c9099f.png">
