class AddUserNameToUser < ActiveRecord::Migration
  def change
    change_column :contributes, :score, :string
  end
end
