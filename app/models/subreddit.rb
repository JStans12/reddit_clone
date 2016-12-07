class Subreddit

  def initialize(attributes={})
    binding.pry
  end

  def self.by_user(user)
    RedditService.subreddits.map do |subreddit|
      Subreddit.new(subreddit[:data])
    end
  end
end
