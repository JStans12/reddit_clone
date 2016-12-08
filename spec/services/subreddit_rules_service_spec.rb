require 'rails_helper'

describe RedditServices do
  context ".rules" do
    it "returns the rules for a subreddit" do
      VCR.use_cassette(".rules") do

        rules = RedditServices.rules("/r/iama")
        rule = rules.first

        expect(rules).to be_an(Array)
        expect(rule).to have_key(:short_name)
        expect(rule).to have_key(:description)
      end
    end
  end
end
