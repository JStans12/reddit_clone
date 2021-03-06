class User < ApplicationRecord

  def self.find_or_create_user(user_data, tokens)
    user = User.find_or_create_by(uid: user_data.id)
    user.username = user_data.username
    user.token = tokens[:token]
    user.refresh_token = tokens[:refresh_token]
    user.karma = user_data.karma
    user.save
    user
  end
end
