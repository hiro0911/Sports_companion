class TeamCommentAddColumnContent < ActiveRecord::Migration[5.2]
  def change
  	add_column :team_comments, :content, :string
  	change_column :team_comments, :content, :string, :null => false
  end
end
