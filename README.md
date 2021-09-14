# 個人制作アプリ　『銀ラン』

# 概要

 https://ginlun-36418.herokuapp.com/

 ・シンプルかつ見やすさと操作性を重視しています！

 ・飲食店側の視点では使いやすくわかりやすい物に、ユーザー側は見やすさと欲しい情報が手に入れられる様にしてあります！
 
  ・いいねやコメントで認知度や意見、リクエストも出来ます！


# テスト用アカウント

・こちらをご使用ください！

 ・メールアドレス　:　wawa@saza

 ・パスワード　　　:　1200ww

  ・ID/Pass

   ・ID　　:　ginza

   ・Pass　:　1122


# 目指した課題解決

　・ユーザー側（飲食店）がインスタやTwitterを使いこなせずに苦労している事！

　・いかに使いやすく！見やすく！飲食側とお客様がわかりやすい物にしました！

　・実際に私が通っている店から、多くの声をお聞きしました。


# 要件定義

・ユーザー管理機能　　：登録したアカウントのみ投稿、コメント、いいねが出来る

・画像投稿機能　　　　：ブラウザ上に画像を投稿、削除出来る

・コメント投稿機能　　：登録したアカウントで投稿、削除が出来る

・いいね機能　　　　　：登録したアカウントのみでいいねが出来る

・検索機能　　　　　　：ログイン状態を問わずに、カテゴリーで検索可にする

# 実装予定の機能

・ユーザー退会機能

・画像を複数乗せれる機能

・いいね通知機能

・フォロー機能

・お気に入り機能

・テストコード

・S3の導入

# 現時点での実装動画

- いいね機能

[![Image from Gyazo](https://i.gyazo.com/4647c29b16608072770fdb992e524b3a.gif)](https://gyazo.com/4647c29b16608072770fdb992e524b3a)

- ページ遷移

[![Image from Gyazo](https://i.gyazo.com/af0efb905bf1ae1e499eaaaffc8429f5.gif)](https://gyazo.com/af0efb905bf1ae1e499eaaaffc8429f5)

- コメント投稿・削除

[![Image from Gyazo](https://i.gyazo.com/b98d0d527bc9efd146f0a4f9dd9e62c3.gif)](https://gyazo.com/b98d0d527bc9efd146f0a4f9dd9e62c3)

- 検索機能

[![Image from Gyazo](https://i.gyazo.com/d1187e47391fd4057121b2d1690a23ae.gif)](https://gyazo.com/d1187e47391fd4057121b2d1690a23ae)


# DB設計


 ![test](https://user-images.githubusercontent.com/87687780/132976895-82945fe8-732a-4799-8bd0-4a197fe0c83d.png)


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