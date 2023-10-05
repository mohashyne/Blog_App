class ChangeLikesColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :likes, :user_id, :author_id
    rename_column :likes, :post_id, :user_id
  end
end
