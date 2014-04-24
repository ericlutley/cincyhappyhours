Before('@omniauth') do
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:facebook] = {
      :provider => "facebook",
      :uid => "123456789",
      :user_info => { :name => "Test User", :image => nil }
  }
end

After('@omniauth') do
  OmniAuth.config.test_mode = false
end
