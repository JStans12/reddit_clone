class RedditUser
  attr_reader :id, :username, :karma

  def initialize(attributes={})
    @id       = attributes[:id]
    @username = attributes[:name]
    @karma    = attributes[:link_karma]
  end

  def self.user_data(token)
    RedditUser.new(RedditServices.new(token).request_user_data)
  end
end
