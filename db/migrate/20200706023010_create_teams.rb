class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
    	t.references :sport, foreign_key: true
    	t.string :image_id
    	t.integer :applicant
    	t.string :area, null: false
    	t.string :team_name, null: false
    	t.text :information
      t.string :stance
      t.text :explanation
      t.timestamps
    end
  end
end
