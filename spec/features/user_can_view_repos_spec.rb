require 'rails_helper'

feature "User can view list of repos" do

  before do
    stub_omniauth
  end

  scenario "and can view repo info" do
    VCR.use_cassette("user_views_repos_feed") do

      visit '/'

      click_on 'Login with Github'

      expect(current_path). to eq root_path

      expect(page).to have_content "Ruby"
      expect(page).to have_content "limsammy/HAL_btc"
      expect(page).to have_content "limsammy/job-tracker"
    end
  end

end