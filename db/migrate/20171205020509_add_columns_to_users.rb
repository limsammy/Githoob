class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nickname, :string
    add_column :users, :email, :string
    add_column :users, :image, :string
    add_column :users, :token, :string
  end
end
