# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  user_id    :integer          not null
#  public     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Goal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
end
