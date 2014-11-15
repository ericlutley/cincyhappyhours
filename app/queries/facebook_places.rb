class FacebookPlaces
  def self.search(name, location, limit = 20)
    graph = Koala::Facebook::API.new(app_access_token)
    params = { type: 'place', center: location, distance: 500, limit: limit }
    results = graph.search(name, params)
    results.select { |res| res['location']['street'].present? }
  end

  def self.app_access_token
    Rails.cache.fetch 'fb_oauth_token' do
      oauth = Koala::Facebook::OAuth.new(ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'])
      oauth.get_app_access_token
    end
  end
end
