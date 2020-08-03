class TeamsAddImageId < ActiveRecord::Migration[5.2]
  def change
  	add_column :teams, :image_id, :text
  end
end
