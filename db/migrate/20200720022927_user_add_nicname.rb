class UserAddNicname < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :nicname, :string
  end
end
