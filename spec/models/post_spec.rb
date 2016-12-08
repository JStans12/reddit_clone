require 'rails_helper'

describe Post do
  context ".top_posts" do
    it "returns top posts for a subreddit" do
      VCR.use_cassette(".top_posts") do

        posts = Post.top_posts("/r/climbing")
        post = posts.first

        expect(posts).to be_an(Array)
        expect(post).to respond_to(:url)
        expect(post).to respond_to(:title)
      end
    end
  end
end
