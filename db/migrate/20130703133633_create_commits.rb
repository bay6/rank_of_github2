class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha
      t.string :html_url
      t.string :author_id
      t.string :author_login
      t.string :author_date
      t.string :committer_name
      t.string :committer_email
      t.integer :project_id

      t.timestamps
    end
  end
end
