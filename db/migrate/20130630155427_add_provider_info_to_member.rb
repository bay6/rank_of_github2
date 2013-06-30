class AddProviderInfoToMember < ActiveRecord::Migration
  def change
    add_column :members, :provider, :string
    add_column :members, :uid, :string
    add_column :members, :name, :string
  end
end
