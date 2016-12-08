require 'rails_helper'

describe Rule do
  context ".subreddit_rules" do
    it "returns an array of rules for a subreddit" do
      VCR.use_cassette(".subreddit_rules") do

        rules = Rule.subreddit_rules("/r/iama")
        rule = rules.first

        expect(rules).to be_an(Array)
        expect(rule).to respond_to(:data)
        expect(rule).to respond_to(:short_name)
      end
    end
  end
end
