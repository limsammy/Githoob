require 'rails_helper'

feature "User logs in with Github" do

  before do
    stub_omniauth
  end

  scenario "user can view profile page" do
    visit root_path

    expect(page).to have_content 'Login with Github'

    click_on "Login with Github"

    expect(current_path).to eq dashboard_path
    expect(page).to have_content 'samlim'
    expect(page).to have_link 'Logout'
    expect(page).to_not have_content 'Login with Github'
  end

  scenario "user can log out" do
    visit root_path

    click_on "Login with Github"

    expect(page).to have_content 'Logout'

    click_on "Logout"

    expect(page).to_not have_content 'Logout'
  end
end