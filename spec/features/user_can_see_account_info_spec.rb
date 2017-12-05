require 'rails_helper'

feature "User can view basic account info and activity on dashboard" do

  before do
    stub_omniauth
  end

  scenario "user can see avatar, starred repos count, followers, following" do
    visit '/'

    click_on 'Login with Github'

    expect(current_path).to eq dashboard_path

    expect(page).to have_css '.avatar'
    expect(page).to have_css '.starred_repos'
    expect(page).to have_content 'Starred Repos (1)'
    expect(page).to have_css '.followers'
    expect(page).to have_content 'Followers (1)'
    expect(page).to have_css '.following'
    expect(page).to have_content 'Following (3)'
  end

  scenario "user can see summary of past commits" do
    visit '/'

    click_on 'Login with Github'

    expect(current_path). to eq dashboard_path

    expect(page).to have_css '.commit_feed'
    expect(page).to have_css('.commit', count: 10)
  end

end
