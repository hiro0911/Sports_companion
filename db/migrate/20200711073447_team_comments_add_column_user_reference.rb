class TeamCommentsAddColumnUserReference < ActiveRecord::Migration[5.2]
  def change
    add_reference :team_comments, :user, foreign_key: true
  end
end
