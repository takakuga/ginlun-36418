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
- has_many :comments

## eats テーブル

| Column      | Type       | Options                        |
| ------      | ------     | -----------                    |
| title       | string     | null: false                    |
| category    | string     | null: false                    |
| price       | integer    | null: false                    |
| detail      | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- has_many :eat_users
- has_many :comments

## comments テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| text         | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| prototype    | references | null: false, foreign_key: true |

- belongs_to :eat
- belongs_to :user