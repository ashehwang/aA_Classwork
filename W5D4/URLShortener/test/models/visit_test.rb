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
require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end