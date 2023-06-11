# アプリケーション名
　smile

# アプリケーション概要
　子供の健康状態を夫婦で共有できるアプリ、受診時に必要な簡単な情報も記載できる

# URL
 https://smile-brrt.onrender.com

# テスト用アカウント 改行する
- Basic認証パスワード 1234
- Basic認証ID papa
- メールアドレス test@test.com
- パスワード a123456

# 利用方法
# 子供の健康状態を投稿　改行する
１．トップページからユーザーの新規登録またはログインを行う  
２．各項目をメニューから選び、必要事項を入力する
# 情報の確認
１．メニューのカルテボタンを押す事で投稿した情報を一覧として表示する

# アプリケーションを作成した背景
妻にヒアリングを行い、急な受診時に母子手帳を持っていない際、今までの成長の状態や
既往歴、薬などの確認ができると便利また、予防接種の日付を記録できる機能があると便利との事。
両親で共有できると尚良いと考え、アプリケーションの開発を行う

# 洗い出した要件
 https://docs.google.com/spreadsheets/d/1oarxka9Om8IlWwogX0aZ5J3Ku9hxL7v_ScH4-sx4Ukk/edit#gid=982722306

# 実装した機能
-ログイン機能
[![Image from Gyazo](https://i.gyazo.com/e030ece462df33e3647fe64a0e00edd7.gif)](https://gyazo.com/e030ece462df33e3647fe64a0e00edd7)

# 実装予定の機能

- ユーザー情報や各項目の編集機能
- javascriptの修正やより使いやすくする為の機能実装

# データベース設計

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