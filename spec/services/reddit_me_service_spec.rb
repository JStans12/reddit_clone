require 'rails_helper'

describe RedditServices do
  context "#request_user_data" do
    it "returns all data for a specific user" do
      VCR.use_cassette("#request_user_data") do

        user = RedditServices.new(ENV['user_test_token']).request_user_data

        expect(user).to have_key(:id)
        expect(user).to have_key(:name)
        expect(user).to have_key(:link_karma)
      end
    end
  end
end
