# テーブル設計

## users テーブル

| Column                  | Type   | Options                  |
| ----------------------- | ------ | ------------------------ |
| nickname                | string | null: false              |
| email                   | string | null: false, unique:true |
| password                | string | null: false              |
| password_confirmation   | string | null: false              |
| family_name             | string | null: false              |
| last_name               | string | null: false              |
| fname_kana              | string | null: false, index:true  |
| lname_kana              | string | null: false              |
| birthday                | date   | null: false              |

### Association

- has_many :items
- has_many :purcheses
- has_many :delivery_destinations

## items テーブル

| Column          | Type   | Options                           |
| --------------- | ------ | --------------------------------- |
| item            | string | null: false, limit:40             |
| discription     | text   | null: false, limit:1000           |
| category        | ENUM   | null: false                       |
| item_state      | ENUM   | null: false                       |
| delivery_charge | ENUM   | null: false                       |
| delivery_source | ENUM   | null: false                       |
| delivery_days   | ENUM   | null: false                       |
| price           | int    | null: false                       |
| user_id         | references | null: false, foreign_key:true |

<!-- imageはActiveStrageにて実装予定 -->

### Association

- belongs_to :user
- has_one :purchas

## purchases テーブル

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| card_num         | int          | null: false                    |
| expiration_month | int          | null: false                    |
| expiration_year  | int          | null: false, limit:40          |
| secrity_code     | int          | null: false, limit:1000        |
| user_id          | references   | null: false, foreign_key: true |
| item_id          | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one :delivery_destination

## delivery_destination テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post_num    | int        | null: false                    |
| address     | ENUM       | null: false                    |
| city        | string     | null: false                    |
| block       | string     | null: false                    |
| building    | string     |                                |
| tell        | int        | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| purchase_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase