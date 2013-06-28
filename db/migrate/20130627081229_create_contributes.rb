class CreateContributes < ActiveRecord::Migration
  def change
    create_table :contributes do |t|
      t.integer :user_id
      t.float :score

      t.timestamps
    end
  end
end
