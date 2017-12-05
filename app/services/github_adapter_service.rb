class GithubAdapterService
  def initialize(user)
    @user = user
    @conn = Faraday.new(url: 'https://api.github.com/') do |faraday|
      faraday.headers['Authorization'] = "token #{user.token}"
      faraday.headers['Accept'] = "application/vnd.github.cloak-preview"
      faraday.adapter Faraday.default_adapter
  end
end