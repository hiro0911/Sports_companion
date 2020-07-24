class CreateSports < ActiveRecord::Migration[5.2]
  def change
    create_table :sports do |t|
    	t.string :sport_genre, null: false
    	t.string :image_id
      t.timestamps
    end
  end
end
