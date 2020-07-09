class RemoveRoomFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :comments, :room, foreign_key: true
  end
  def change
  	add_reference :comments, :comment_room, foreign_key: true
  end
end
