class AddUserIdToTrailers < ActiveRecord::Migration[7.0]
  def change
    add_column :trailers, :user_id, :integer
    add_index :trailers, :user_id
  end
end
