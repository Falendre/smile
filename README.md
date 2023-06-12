# アプリケーション名
　smile

# アプリケーション概要
　子供の健康状態を夫婦で共有できるアプリ、受診時に必要な簡単な情報も記載できる

# URL
 https://smile-brrt.onrender.com

# テスト用アカウント
- Basic認証パスワード 1234
- Basic認証ID papa
- メールアドレス test@test.com
- パスワード a123456

# 利用方法
# 子供の健康状態を投稿
１．トップページからユーザーの新規登録またはログインを行う  
２．各項目をメニューから選び、必要事項を入力する
# 情報の確認
１．メニューのカルテボタンを押す事で投稿した情報を一覧として表示する

# アプリケーションを作成した背景
家族にヒアリングを行ったところ、子供の成長記録や既往歴の記録に以下の課題があることが判明
- 急な受診で母子手帳を持っていない際に、過去の既往歴などを確認できない
- 母子手帳がなくても、今までの成長の状態や既往歴、薬の服用歴など確認ができると便利
- 予防接種の日付を記録できる機能があると便利
そこで、それらの課題を解決し、母子手帳がなくてもデータとして両親で共有できるアプリケーションの開発を実施。

# 洗い出した要件
[要件定義シート](https://docs.google.com/spreadsheets/d/1oarxka9Om8IlWwogX0aZ5J3Ku9hxL7v_ScH4-sx4Ukk/edit#gid=982722306)

# 実装した機能
- ログイン機能
[![Image from Gyazo](https://i.gyazo.com/e030ece462df33e3647fe64a0e00edd7.gif)](https://gyazo.com/e030ece462df33e3647fe64a0e00edd7)

- ログアウト機能
[![Image from Gyazo](https://i.gyazo.com/15163b53c46383a49e76734a6f7cc999.gif)](https://gyazo.com/15163b53c46383a49e76734a6f7cc999)

- 各項目へのリンク機能
[![Image from Gyazo](https://i.gyazo.com/630850051b7344830d66ad4ce1748bfd.gif)](https://gyazo.com/630850051b7344830d66ad4ce1748bfd)

- お薬手帳の画像投稿機能
[![Image from Gyazo](https://i.gyazo.com/916e9f3291bd21abf90ae02d9ba034e3.gif)](https://gyazo.com/916e9f3291bd21abf90ae02d9ba034e3)

- 成長の記録をグラフで表示、最新データは5件まで表示（もっと見るをクリックする事で過去のデータを見れるように今後実装予定）
[![Image from Gyazo](https://i.gyazo.com/102acb55477ec2ffc5c7dc9d03c547b3.gif)](https://gyazo.com/102acb55477ec2ffc5c7dc9d03c547b3)

# 実装予定の機能

- ユーザー情報や各項目の編集機能
- javascriptの修正やより使いやすくする為の機能（接種済みのワクチンには済みの印鑑マークをつけられる等）実装
- 冗長コード修正やインデントを整える
- バリデーションの調整

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/90525d6b5ca8437e2581b4c3d0b67e30.png)](https://gyazo.com/90525d6b5ca8437e2581b4c3d0b67e30)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/a80b888be7aaee9fc2192f458040beb1.png)](https://gyazo.com/a80b888be7aaee9fc2192f458040beb1)

# テーブル設計

### users テーブル

| Column             | Type    | Options                   |
| :----------------- | :------ | :------------------------ |
| name               | string  | null: false               |
| gender             | string  | null: false               |
| blood_type         | string  |                           |
| birth_day          | date    | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |





#### Association
- has_many :body_types
- has_many :allergies
- has_many :underlying_conditions
- has_many :medications
- has_many :vaccines


### body_types テーブル

| Column             | Type       | Options                        |
| :----------------- | :--------- | :----------------------------- |
| user               | references | null: false, foreign_key: true |
| measurement_date   | date       | null: false                    |
| height             | string     | null: false                    |
| weight             | string     | null: false                    |
| notes              | text       |                                |

#### Association
- belongs_to :user


### allergies テーブル

| Column             | Type       | Options                        |
| :----------------- | :--------- | :----------------------------- |
| user               | references | null: false, foreign_key: true |
| kinds              | string     | null: false                    |
| notes              | text       |                                |
 
#### Association
- belongs_to :user


### underlying_conditions テーブル

| Column             | Type       | Options                        |
| :----------------- | :--------- | :----------------------------- |
| user               | references | null: false, foreign_key: true |
| details            | string     | null: false                    |
| diagnosis_date     | date       | null: false                    |
| notes              | text       |                                |
 
#### Association
- belongs_to :user


### medications テーブル

| Column             | Type       | Options                        |
| :----------------- | :--------- | :----------------------------- |
| user               | references | null: false, foreign_key: true |
| prescription_date  | date       | null: false                    |
| notes              | text       |                                |
 
#### Association
- belongs_to :user


### vaccines テーブル

| Column             | Type       | Options                        |
| :----------------- | :--------- | :----------------------------- |
| user               | references | null: false, foreign_key: true |
| vaccine_name       | string     | null:false                     |
| vaccination_date   | date       | null: false                    |
| notes              | text       |                                |
 
#### Association
- belongs_to :user

# 開発環境

- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディタ
- タスク管理

# ローカルでの動作方法
以下のコマンドを順に実行  
% git clone https://github.com/Falendre/smile.git  
% cd smile  
% bundle install  
% yarn install

# 工夫したポイント
①小さな子供を持つ両親をターゲットにしている為、色合いを見やすいかつ穏やかな色に設定しました  
②急な受診時等母子手帳が手元にない時にすぐに子供の情報を取れるようにシンプルなデザインで機能も最小限必要なものだけにしています