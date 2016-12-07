require 'rails_helper'

describe RedditUser do
  context ".user_data" do
    it "returns all data for a user" do
      VCR.use_cassette(".user_data") do

        user = RedditUser.user_data(ENV["user_test_token"])

        expect(user).to respond_to(:id)
        expect(user).to respond_to(:username)
        expect(user).to respond_to(:karma)
      end
    end
  end
end
#
