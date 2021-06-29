# README

## usersテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|email| string | null: false, unique: true | 
|encrypted_password|string| null: false |
|nickname|string| null: false |
|family_name|string| null: false |
|first_name|string|null: false|
|furigana_family_name|string|null: false|
|furigana_first_name|string|null: false|
|birthdate|date|null: false|

### Association
- has_many : items
- has_many : purchases

## itemsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|name|string| null: false |
|description|text| null: false |
|category_id|integer| null: false |
|delivery_charge_id|integer| null: false |
|delivery_source_id|integer| null: false |
|day_id|integer| null: false |
|price|integer| null: false |
|condition_id|integer| null: false |
|user|references| foreign_key: true |

### Association
- has_one : purchase
- belongs_to : users

## purchaseテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|item|references| foreign_key: true |
|user|references| foreign_key: true |


### Association
- belongs_to : users
- belongs_to : items
- has_one    : delivery_address


## delivery_addressテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|postal_code|string| null: false |
|delivery_source_id|integer| null: false |
|city|string| null: false |
|block|string| null: false |
|building_name|string|  |
|phone_number|string| null: false |
|purchase|references| foreign_key: true |


### Association
- belongs_to : purchase