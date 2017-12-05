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
    info = @conn.get('/user').body
    JSON.parse(info, symbolize_names: true)
  end
end