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
FactoryBot.define do
  factory :goal do
    
  end
end
