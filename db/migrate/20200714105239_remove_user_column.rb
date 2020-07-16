class RemoveUserColumn < ActiveRecord::Migration[5.2]
  def down
  	remove_column :users, :token, :string
    remove_column :users, :meta, :string
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
  end
end
