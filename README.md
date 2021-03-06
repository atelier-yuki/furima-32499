# テーブル設計

## users テーブル

| Column                  | Type   | Options                  |
| ----------------------- | ------ | ------------------------ |
| nickname                | string | null: false              |
| email                   | string | null: false, unique:true |
| encrypted_password      | string | null: false              |
| family_name             | string | null: false              |
| last_name               | string | null: false              |
| fname_kana              | string | null: false, index:true  |
| lname_kana              | string | null: false              |
| birthday                | date   | null: false              |

### Association

- has_many :items
- has_many :purcheses

## items テーブル

| Column             | Type       | Options                           |
| ------------------ | -----------| --------------------------------- |
| item_name          | string     | null: false, limit:40             |
| discription        | text       | null: false, limit:1000           |
| category_id        | integer    | null: false                       |
| item_state_id      | integer    | null: false                       |
| delivery_charge_id | integer    | null: false                       |
| address_id         | integer    | null: false                       |
| delivery_day_id    | integer    | null: false                       |
| price              | integer    | null: false                       |
| user               | references | null: false, foreign_key:true |

<!-- imageはActiveStrageにて実装予定 -->

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| user             | references   | null: false, foreign_key: true |
| item             | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_destination

## delivery_destination テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post_num    | string     | null: false                    |
| address_id  | integer    | null: false                    |
| city        | string     | null: false                    |
| block       | string     | null: false                    |
| building    | string     |                                |
| tell        | string     | null: false                    |
| purchase    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase