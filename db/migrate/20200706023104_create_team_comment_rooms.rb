class CreateTeamCommentRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :team_comment_rooms do |t|
    	t.integer :team_id
    	t.string :title
      t.timestamps
    end
  end
end
