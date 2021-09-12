# 個人制作アプリ　『銀ラン』

# 概要

 https://ginlun-36418.herokuapp.com/

 ・シンプルかつ見やすさと操作性を重視しています！

 ・飲食店側の視点では使いやすくわかりやすい物に、ユーザー側は
　見やすさと欲しい情報が手に入れられる様にしてあります！
 
  ・いいねやコメントで認知度や意見、リクエストも出来ます！


# テスト用アカウント

・こちらをご使用ください！

 ・メールアドレス　:　wawa@saza

 ・パスワード　　　:　1200ww

  ・ID/Pass

   ・ID　　:　ginza

   ・Pass　:　1122

# 目指した課題解決

　・ユーザー側（飲食店）がインスタやTwitterを使いこなせずに苦労して
　いる事！

　・いかに使いやすく！見やすく！飲食側とお客様がわかりやすい物に
　しました！

　・実際に私が通っている店から、多くの声をお聞きしました。

　・参考と確証の為に自分のインスタを紹介させて頂きます。

　　[![Image from Gyazo](https://i.gyazo.com/a33cdf4e74ace1c878261de7afc518ec.jpg)](https://gyazo.com/a33cdf4e74ace1c878261de7afc518ec)


# 要件定義

・ユーザー管理機能　登録したアカウントのみ投稿、コメント、いいねが出来る

・画像投稿機能　ブラウザ上に画像を投稿、削除できる

・コメント投稿機能　登録したアカウントで投稿、削除ができる

・いいね機能　登録したアカウントのみでいいねができる

# 実装予定の機能

・ユーザー退会機能

・画像を複数乗せれる機能

・いいね通知機能

・フォロー機能

・お気に入り機能

・テストコード

・S3の導入

# 現時点での実装動画


 

# DB設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| profile            | text   | null: false |
| email              | string | null: false |
| password           | string | null: false |

### Association

- has_many :eat_users
- has_many :goods
- has_many :comments

## eats テーブル

| Column      | Type       | Options                        |
| ------      | ------     | -----------                    |
| title       | string     | null: false                    |
| shop_name   | string     | null: false                    |
| category    | string     | null: false                    |
| price       | integer    | null: false                    |
| detail      | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- has_many :eat_users
- has_many :goods
- has_many :comments

## comments テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| text         | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| eat          | references | null: false, foreign_key: true |

- belongs_to :eat
- belongs_to :user

## goods テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| user         |            | null: false, foreign_key: true |
| eat          | references | null: false, foreign_key: true |

- belongs_to :eat
- belongs_to :user