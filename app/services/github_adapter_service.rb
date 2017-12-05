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
    response = @conn.get('/user').body
    JSON.parse(response, symbolize_names: true)
  end

  def get_starred_repos_count
    response = @conn.get('/user/starred').body
    parsed = JSON.parse(response)
    parsed.count
  end

  def get_recent_commits
    
  end

  def get_recent_following_commits
    
  end

  def get_repos
    
  end
end