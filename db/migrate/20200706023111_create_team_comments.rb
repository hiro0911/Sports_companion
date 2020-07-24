class CreateTeamComments < ActiveRecord::Migration[5.2]
  def change
    create_table :team_comments do |t|
    	t.references :team_comment_room, foreign_key: true
    	t.string 		 :content
      t.timestamps
    end
  end
end
