require 'rails_helper'

describe RedditServices do
  context "#subreddit_by_name" do
    it "returns subreddit info by name" do
      VCR.use_cassette("#subreddit_by_name") do
        
        subreddit = RedditServices.new("token").subreddit_by_name("IAMA")

        expect(subreddit).to have_key(:data)
      end
    end
  end
end
