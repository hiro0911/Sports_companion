class TeamsAddImageIdText < ActiveRecord::Migration[5.2]
  def change
  	remove_column :teams, :image_id, :string
  end

end
