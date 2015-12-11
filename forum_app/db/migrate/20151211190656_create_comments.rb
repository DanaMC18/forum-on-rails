class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content 
      t.references :user
      t.references :topic
      t.timestamp, null: false
    end
  end
end
