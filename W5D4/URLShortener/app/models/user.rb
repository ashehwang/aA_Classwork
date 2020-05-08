# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

    
#
class User < ApplicationRecord
    validates :username, :email, presence: true, uniqueness: true
    validate :email_not_valid?

    has_many :submitted_urls,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :ShortenedUrl

    def email_not_valid?
        if email && email.split("@").length != 2 
            errors[:email] << "invalid email"
        end
    end
end
