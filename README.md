## users

| Column           | Type   | Options                   |
| ---------------- | ------ | ------------------------- |
| nickname         | string | null: false, unique: true |
| email            | string | null: false, unique: true |
| password         | string | null: false, unique: true |
| first_name       | string | null: false               |
| family_name      | string | null: false               |
| first_name_kana  | string | null: false               |
| family_name_kana | string | null: false               |
| birthday         | string | null: false               |

### Association

- has_many :items
- has_many :records

## items

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| consignor        | string     | null: false                    |
| days             | string     | null: false                    |
| shipping_frees   | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :records

## records

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| shipping | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :shipping

## Shippings

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| post_code    | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| address      | string  | null: false |
| phone_number | integer | null: false |

### Association

- has_many :records