require 'rails_helper'

describe RedditServices do
  context "#subreddits" do
    it "returns all subreddits for logged in user" do
      VCR.use_cassette("#subreddits") do

        subreddits = Subreddit.by_user(ENV['user_test_token'])
        subreddit = subreddits.first

        expect(subreddits).to be_an(Array)
        expect(subreddit.data).to have_key(:name)
      end
    end
  end

  context "#subreddit_by_name" do
    it "returns subreddit info by name" do
      VCR.turned_off do
        WebMock.allow_net_connect!

        subreddit = Subreddit.by_name("IAMA")
      end
    end
  end
end
