class CreateTeamComments < ActiveRecord::Migration[5.2]
  def change
    create_table :team_comments do |t|
    	t.integer :user_id
    	t.integer :team_comment_room_id
    	t.string 		 :content
      t.timestamps
    end
  end
end
