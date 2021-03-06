## users

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false,              |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :cards

## items

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| name              | string      | null: false                    |
| description       | text        | null: false                    |
| category_id       | integer     | null: false                    |
| status_id         | integer     | null: false                    |
| shipping_free_id  | integer     | null: false                    |
| prefecture_id     | integer     | null: false                    |
| schedule_id       | integer     | null: false                    |
| price             | integer     | null: false                    |
| user              | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## Shippings

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| post_code     | string      | null: false                    |
| prefecture_id | integer     | null: false                    |
| city          | string      | null: false                    |
| address       | string      | null: false                    |
| building_name | string      |                                |
| phone_number  | integer     | null: false                    |
| order         | references  | null: false, foreign_key: true |

### Association

- belongs_to :order

## Cards

| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| card_token     | string     | null: false, unique: true       |
| customer_token | string     | null: false,                    |
| user           | references | null: false, foreign__key: true |

### Association

- belongs_to :user