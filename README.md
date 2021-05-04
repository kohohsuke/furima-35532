## users

| Column                     | Type   | Options                   |
| -------------------------- | ------ | ------------------------- |
| nickname                   | string | null: false, unique: true |
| email                      | string | null: false, unique: true |
| encrypted_password         | string | null: false,              |
| first_name                 | string | null: false               |
| family_name                | string | null: false               |
| first_name_kana            | string | null: false               |
| family_name_kana           | string | null: false               |
| birthday                   | date   | null: false               |

### Association

- has_many :items
- has_many :records

## items

| Column                      | Type        | Options                        |
| --------------------------  | ----------- | ------------------------------ |
| name                        | string      | null: false                    |
| description                 | text        | null: false                    |
| category_id                 | integer     | null: false                    |
| status_id                   | integer     | null: false                    |
| prefecture_id               | integer     | null: false                    |
| days_id                     | integer     | null: false                    |
| shipping_frees              | integer     | null: false                    |
| price                       | integer     | null: false                    |
| user                        | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :record

## records

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | integer    | null: false, foreign_key: true |
| item_id      | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## Shippings

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| post_code          | string      | null: false                    |
| prefecture_id      | integer     | null: false                    |
| city               | string      | null: false                    |
| address            | string      | null: false                    |
| building_name      | string      |                                |
| phone_number       | string      | null: false                    |
| record_id          | integer     | null: false, foreign_key: true |

### Association

- belongs_to :record