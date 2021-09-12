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




# テーブル設計

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