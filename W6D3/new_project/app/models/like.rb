# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  user_id       :integer
#  likeable_type :string
#  likeable_id   :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Like < ApplicationRecord
    
    belongs_to :user

    belongs_to :likeable,
    polymorphic: true
end

# create_table "likes", force: :cascade do |t|
#     t.integer "user_id"
#     t.string "likeable_type"
#     t.bigint "likeable_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
#   end
