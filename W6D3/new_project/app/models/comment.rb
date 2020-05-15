# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  artwork_id :integer          not null
#  body       :text             not null
#
class Comment < ApplicationRecord
    belongs_to :author,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :artwork

    has_many :likes,
    as: :likeable

end
