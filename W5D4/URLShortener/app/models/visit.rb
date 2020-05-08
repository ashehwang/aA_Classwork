# == Schema Information
#
# Table name: visits
#
#  id           :bigint           not null, primary key
#  visitor_id   :integer          not null
#  short_url_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Visit < ApplicationRecord
    validates :visitor_id, :short_url_id, presence: true
end
