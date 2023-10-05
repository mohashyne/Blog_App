class ChangeUserIdAndPostIdInLikes < ActiveRecord::Migration[7.0]
  def change
    change_column :likes, :user_id, :integer
    change_column :likes, :post_id, :integer
  end
end
