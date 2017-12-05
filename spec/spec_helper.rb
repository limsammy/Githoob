RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  def stub_omniauth
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: "github",
    uid: "123456789",
    info: {
      name: 'Sam Lim',
      nickname: 'limsammy',
      email: 'sa@sam.com',
      image: 'https://avatars0.githubusercontent.com/u/10293366'
    },
    credentials: {
      token: ENV["USER_TOKEN"]
    }
    })
end
end
