class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
    	t.integer :content
      t.timestamps
    end
  end
end
