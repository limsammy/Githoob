class DashboardController < ApplicationController
  before_action :require_user

  def index
    @user = current_user
    @basic_info = GithubService.new(@user).get_basic_info
    @starred_repos = GithubService.new(@user).get_starred_repos_count
    @recent_commits = GithubService.new(@user).get_recent_commits
    @following_commits = GithubService.new(@user).get_recent_following_commits
    @repos = GithubService.new(@user).get_repos
  end
end