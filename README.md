# テーブル設計

## usersテーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| last_name_furigana  | string  | null: false |
| first_name_furigana | string  | null: false |
| birth_date          | date    | null: false |

### Association

- has_many :items
- has_many :buys

## itemsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | -----------------------------  |
| item_name | string     | null: false                    | 
| details   | text       | null: false                    |
| price     | integer    | null: false                    |
| commission| integer    | null: false                    |
| benefit   | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buys

## deliveries

| Column        | Type       | Options                        |
| ------------- | ---------- | -----------------------------  |
| postal_code   | integer    | null: false                    |
| citys         | string     | null: false                    |
| address       | integer    | null: false                    |
| building_name | string     |                                |
| phone         | integer    | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association
- belongs_to :buy


## buys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | -----------------------------  |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :deliveries