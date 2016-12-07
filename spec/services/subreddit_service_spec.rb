require 'rails_helper'

describe RedditServices do
  context "#subreddits" do
    it "returns all subreddits for logged in user" do
      VCR.use_cassette("#subreddits") do

        subreddits = RedditServices.new(ENV['user_test_token2']).subreddits
        subreddit = subreddits.first

        expect(subreddits).to be_an(Array)
        expect(subreddit).to have_key(:data)
      end
    end
  end
end
