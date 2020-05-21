# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do

  
  pending "add some examples to (or delete) #{__FILE__}"
  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:session_token)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_uniqueness_of(:username) }
  subject(:dummy) { User.create(username: "dummy", password: '123456')}
  it { should validate_uniqueness_of(:session_token)}
  it { should validate_length_of(:password).is_at_least(6)}

  describe 'finds by credentials' do
    it 'will return user if password and username is right' do
      joe = User.create(username: "Joe", password: "123456")
      user = User.find_by_credentials("Joe", "123456")
      expect(joe.username).to eq(user.username)
      expect(joe.password_digest).to eq(user.password_digest)
    end
  end
end


#self.find_by_credentials
#password = (password)
#is_password?
#reset_session_token
#encore
