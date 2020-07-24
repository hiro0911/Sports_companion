class CreateCommentRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_rooms do |t|
    	t.integer :sport_id
    	t.string :title
      t.timestamps
    end
  end
end
