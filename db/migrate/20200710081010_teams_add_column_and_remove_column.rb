class TeamsAddColumnAndRemoveColumn < ActiveRecord::Migration[5.2]
  def change
  	add_column :teams, :stance, :string
  	add_column :teams, :explanation, :text
  end
end
