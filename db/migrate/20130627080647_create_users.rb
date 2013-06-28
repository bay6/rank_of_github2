class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :login
      t.integer :followers
      t.integer :following
      t.string :avatar_url

      t.timestamps
    end
  end
end
