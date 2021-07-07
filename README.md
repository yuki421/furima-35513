# README

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :addresses

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| description | text       | null: false                    |
| sell_user   | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| order       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :orders
- has_many :orders, through: :item_orders

## item_orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| order   | references | null: false, foreign_key: true |

## orders テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| buy_item | string     | null: false                    |
| buy_user | string     | null: false                    |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| address  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :items
- has_many :items, through: :item_orders
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| street_number | string     | null: false                    |
| building      | string     | null: false                    |
| phone         | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order