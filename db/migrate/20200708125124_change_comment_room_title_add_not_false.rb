class ChangeCommentRoomTitleAddNotFalse < ActiveRecord::Migration[5.2]
  def up
  	change_column :comment_rooms, :title, :string, null: false
  	change_column :team_comment_rooms, :title, :string, null: false
  end
  def down
  	change_column :comment_rooms, :title, :string
  	change_column :team_comment_rooms, :title, :string
  end
end
