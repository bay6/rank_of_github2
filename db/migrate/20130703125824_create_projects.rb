class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :uid
      t.string :name
      t.string :description
      t.string :html_url
      t.string :avatar_url
      t.string :starred_url

      t.timestamps
    end
  end
end
