class CreateCommentRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_rooms do |t|
    	t.references :sport, foreign_key: true
    
      t.timestamps
    end
  end
end
