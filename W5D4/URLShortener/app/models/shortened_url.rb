# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string
#  short_url  :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class ShortenedUrl < ApplicationRecord

    validates :short_url, uniqueness: true, presence: true
    validates :long_url, presence: true

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    after_initialize do |shortened_url|
        shortened_url.short_url = ShortenedUrl.random_code
    end

    def self.random_code
        loop do 
            code = SecureRandom.urlsafe_base64(16)
            return code unless ShortenedUrl.exists?({ short_url: code })
        end
    end

    def self.create_multiple(user, long_url)
        ShortenedUrl.create!(long_url: long_url, short_url: ShortenedUrl.random_code, user_id: user.id)
    end

end
