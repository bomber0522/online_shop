## online_shop

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|
|email|string|name: "index_members_on_email", unique: true|
|text|profile|

### Association
- has_many :entries, dependent: :destory
- has_many :votes, dependent: :destroy

## articlesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|body|text|null: false|
|released_at|datetime|null: false|
|expired_at|datetime|
|member_only|boolean|null: false, default: false|
