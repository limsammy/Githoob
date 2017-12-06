class GithubAdapterService

  def initialize(user)
    @user = user
    @conn = Faraday.new(url: 'https://api.github.com/') do |faraday|
      faraday.headers['Authorization'] = "token #{user.token}"
      faraday.headers['Accept'] = "application/vnd.github.cloak-preview"
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_basic_info
    get_json('/user')
  end

  def get_starred_repos_count
    get_json('/user/starred').count
  end

  def get_recent_commits
    get_json("/search/commits?q=author:#{@user.nickname}&sort=author-date")[:items][0..9]
  end

  def following_users
    following_users = []
    get_json("/users/#{@user.nickname}/following").each do |user|
      following_users << user[:login]
    end
    following_users
  end

  def get_recent_following_commits
    following_commits = {}
    following_users.each do |user_nickname|
      following_commits[user_nickname] = get_json("/search/commits?q=author:#{user_nickname}&sort=author-date")[:items][0..2]
    end
    following_commits
  end

  def get_repos
    get_json("/users/#{@user.nickname}/repos?sort=updated")
  end

  private
    attr_reader :user, :conn

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end