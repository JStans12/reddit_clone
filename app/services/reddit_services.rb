class RedditServices

  def initialize(token)
    @token = token
  end

  def request_user_data
    user_data = connection.get("/api/v1/me")
    JSON.parse(user_data.body, symbolize_names: true)
  end

  def subreddits
    response = connection.get("/subreddits/mine/subscriber?limit=10")
    subreddits = JSON.parse(response.body, symbolize_names: true)
    subreddits[:data][:children]
  end

  def subreddit_by_name(name)
    response = Faraday.get("https://www.reddit.com/r/#{name}/about.json")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_posts(url)
    response = Faraday.get("https://www.reddit.com#{url}.json")
    posts = JSON.parse(response.body, symbolize_names: true)
    posts[:data][:children]
  end

  def self.rules(url)
    response = Faraday.get("https://www.reddit.com#{url}/about/rules.json")
    rules = JSON.parse(response.body, symbolize_names: true)
    rules[:rules]
  end

  private

    def connection
      oauth_connection = Faraday.new("https://oauth.reddit.com")
      oauth_connection.authorization(:bearer, @token)
      oauth_connection
    end
end
