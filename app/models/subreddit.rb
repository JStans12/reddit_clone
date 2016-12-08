class Subreddit
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def self.by_user(token)
    RedditServices.new(token).subreddits.map do |subreddit|
      Subreddit.new(subreddit[:data])
    end
  end

  def self.by_name(name)
    Subreddit.new(RedditServices.new("token").subreddit_by_name(name)[:data])
  end

  def self.display_names(token)
    Subreddit.by_user(token).map do |subreddit|
      subreddit.data[:display_name]
    end
  end
end
