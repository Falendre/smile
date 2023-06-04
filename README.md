# アプリケーション名
　smile

# アプリケーション概要
　子供の健康状態を夫婦で共有できるアプリ、受診時に必要な簡単な情報も記載できる

# URL
 https://smile-brrt.onrender.com

# テスト用アカウント


# 利用方法


# テーブル設計

### users テーブル

| Column             | Type    | Options                   |
| :----------------- | :------ | :------------------------ |
| name               | string  | null: false               |
| gender_id          | integer | null: false               |
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
| measurement_date   | date       | null: false                    |
| height             | string     | null: false                    |
| weight             | string     | null: false                    |
| notes              | text       |                                |

#### Association
- belongs_to :user


### allergies テーブル

| Column             | Type       | Options                        |
| :----------------- | :--------- | :----------------------------- |
| kinds              | string     | null: false                    |
| notes              | text       |                                |
 
#### Association
- belongs_to :user


### underlying_conditions テーブル

| Column             | Type       | Options                        |
| :----------------- | :--------- | :----------------------------- |
| details            | string     | null: false                    |
| diagnosis_date     | date       | null: false                    |
| notes              | text       |                                |
 
#### Association
- belongs_to :user


### medications テーブル

| Column             | Type    | Options                   |
| :----------------- | :------ | :------------------------ |
| prescription_date  | date    | null: false               |
| notes              | text    |                           |
 
#### Association
- belongs_to :user


### vaccines テーブル

| Column             | Type    | Options                   |
| :----------------- | :------ | :------------------------ |
| vaccine_name       | string  | null:false
| vaccination_date   | date    | null: false               |
| notes              | text    |                           |
 
#### Association
- belongs_to :user