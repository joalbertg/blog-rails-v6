# frozen_string_literal: true

# create articles table
class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :status

      t.timestamps
    end
  end
end
