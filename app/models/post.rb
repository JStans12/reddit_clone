class Post
  attr_reader :url, :name

  def initialize(data)
    @data = data
  end

  def url
    @data[:url]
  end

  def title
    @data[:title]
  end

  def ups
    @data[:ups]
  end

  def self.top_posts(url)
    RedditServices.top_posts(url).map do |post|
      Post.new(post[:data])
    end
  end
end
