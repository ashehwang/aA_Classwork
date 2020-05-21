require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do

  background :each do
    visit new_user_url
  end

  scenario 'has a new user page' do
    expect(page).to have_content("Sign Up")
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do
      fill_in 'Username', with: 'Mapa'
      fill_in 'Password', with: '123456'

      click_button 'Sign Up'

      expect(page).to have_content('Mapa')
      user = User.find_by(username: 'Mapa')
      expect(current_url).to eq(user_url(user))
    end

  end
end

# feature "the signin process", type: :feature do
#   background :each do
#     User.create(username: 'user@example.com', password: 'password')
#   end

#   it "signs me in" do
#     visit '/sessions/new'
#     within("#session") do
#       fill_in 'Username', with: 'user@example.com'
#       fill_in 'Password', with: 'password'
#     end
#     click_button 'Log In'
#     expect(page).to have_content 'user@example.com'
#   end
# end

feature 'logging in' do

  background :each do
    visit new_session_url
  end
  
  scenario 'shows username on the homepage after login' do
  
    fill_in 'Username', with: 'Mapa'
    fill_in 'Password', with: '123456'

    click_button 'Log In'

    expect(page).to have_content('Mapa')
    user = User.find_by(username: 'Mapa')
    expect(current_url).to eq(user_url(user))
  end

end

feature 'logging out' do

  background :each do
    visit users_url
  end

  scenario 'begins with a logged out state' do
    expect(page).to have_content('Log In')
  end


  scenario 'doesn\'t show username on the homepage after logout' do
    click_button 'Log In'

    fill_in 'Username', with: 'Mapa'
    fill_in 'Password', with: '123456'

    click_button 'Log In'
    click_button 'Log Out'
    expect(page).not_to have_content('Mapa')
  end

end