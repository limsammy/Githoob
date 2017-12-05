class DashboardController < ApplicationController
  before_action :require_user

  def index
    @user = current_user
    client = GithubAdapterService.new(@user)
    @basic_info = client.get_basic_info
    @starred_repos = client.get_starred_repos_count
    @recent_commits = client.get_recent_commits
    @following_commits = client.get_recent_following_commits
    @repos = client.get_repos
  end
end