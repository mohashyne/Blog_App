class ChangeLikesColumnsUid < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :user_id, :post_id
  end
end
