require 'rails_helper'

feature "User can view basic account info and activity on dashboard" do

  before do
    stub_omniauth
  end

  scenario "user can see avatar, starred repos count, followers, following" do
    VCR.use_cassette("basic_info") do
      visit '/'

      click_on 'Login with Github'

      expect(current_path).to eq root_path

      expect(page).to have_css '.avatar'
      expect(page).to have_content 'Starred: 9'
      expect(page).to have_content 'Followers: 1'
      expect(page).to have_content 'Following: 4'
    end
  end

  scenario "user can see summary of past commits" do
    VCR.use_cassette("past_commits") do
      visit '/'

      click_on 'Login with Github'

      expect(current_path). to eq root_path

      expect(page).to have_css '.commit_feed'
      expect(page).to have_css('.commit', count: 10)
    end
  end

end
