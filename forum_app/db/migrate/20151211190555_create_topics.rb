class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t| 
      t.string :title
      t.text :content
      t.references :user
      t.timestamp, null: false
    end
  end
end
