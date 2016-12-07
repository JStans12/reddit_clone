class Subreddit
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.by_user(token)
    RedditServices.new(token).subreddits.map do |subreddit|
      Subreddit.new(subreddit[:data][:display_name])
    end
  end
end
