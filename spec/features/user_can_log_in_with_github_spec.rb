require 'rails_helper'

feature "User logs in with Github" do

  before do
    stub_omniauth
  end

  scenario "user can view profile page" do
    VCR.use_cassette("profile_page") do
      visit root_path

      expect(page).to have_content 'Login with Github'

      click_on "Login with Github"

      expect(current_path).to eq root_path
      expect(page).to have_content 'Sam Lim'
      expect(page).to have_content 'limsammy'
      expect(page).to have_link 'Logout'
      expect(page).to_not have_content 'Login with Github'
    end
  end

  scenario "user can log out" do
    VCR.use_cassette("logout") do
      visit root_path

      click_on "Login with Github"

      expect(page).to have_content 'Logout'

      click_on "Logout"

      expect(page).to_not have_content 'Logout'
    end
  end
end