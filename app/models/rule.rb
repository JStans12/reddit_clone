class Rule
  attr_reader :data, :short_name

  def initialize(data)
    @data = data
  end

  def short_name
    @data[:short_name]
  end

  def self.subreddit_rules(url)
    RedditServices.rules(url).map do |rule|
      Rule.new(rule)
    end
  end
end
