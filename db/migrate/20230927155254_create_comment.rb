# frozen_string_literal: true

class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.text :text
      t.timestamps
    end
  end
end
