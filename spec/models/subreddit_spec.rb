require 'rails_helper'

describe RedditServices do
  context "#subreddits" do
    it "returns all subreddits for logged in user" do
      VCR.use_cassette("#subreddits") do

        subreddits = Subreddit.by_user(ENV['user_test_token2'])
        subreddit = subreddits.first

        expect(subreddits).to be_an(Array)
        expect(subreddit).to respond_to(:name)
      end
    end
  end
end
