# README

## usersテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| email   | string | null: false |
| password|string| null: false |
|nickname|string| null: false |
|family_name|string| null: false |
|first_name|string|null: false|
|furigana_family_name|string|null: false|
|furigana_first_name|string|null: false|
|birthdate|date|null: false|

### Association
- has_many : items
- has_many : purchase


## itemsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|name|string| null: false |
|category|string| null: false |
|delivery_charge|integer| null: false |
|delivery_source|string| null: false |
|days|integer| null: false |
|price|integer| null: false |
|condition|string| null: false |
|user|references||

### Association
- has_one : purchase
- belongs_to : users

## purchaseテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|item|references||
|user|references||


### Association
- belongs_to : users
- belongs_to : items
- has_one    : delivery_address


## delivery_addressテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|postal_code|integer| null: false |
|prefecture|string| null: false |
|city|string| null: false |
|block|integer| null: false |
|phone_number|integer| null: false |
|purchase|references||

### Association
- belongs_to : purchase