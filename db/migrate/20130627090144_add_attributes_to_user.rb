class AddAttributesToUser < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.string :fullname
      t.string :location
      t.string :language
      t.string :username
      t.float :score
    end
  end
end
