require 'rails_helper'

describe RedditServices do
  context ".top posts" do
    it "returns hot posts for subreddidt" do
      VCR.use_cassette(".top_posts") do

        posts = RedditServices.top_posts("/r/climbing")
        post = posts.first

        expect(posts).to be_an(Array)
        expect(post).to have_key(:data)
      end
    end
  end
end
