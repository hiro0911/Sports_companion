class CommentsAddTable < ActiveRecord::Migration[5.2]
  def change
  	  create_table :comments do |t|
    	t.integer :user_id
    	t.integer :comment_room_id
    	t.text :sentence

      t.timestamps
    end
  end
end
