require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  scenario 'user logs in successfully' do
    
    user = FactoryBot.create(:user, username: 'testuser')

    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
    
    expect(page).to have_text('Signed in successfully.')
  end

  scenario 'user fails to log in with wrong password' do
    user = FactoryBot.create(:user, username: 'testuser')

    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Log in'
    
    expect(page).to have_text('Invalid Username or password.')
  end
end
