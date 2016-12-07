class AddKarmaToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :karma, :string
  end
end
