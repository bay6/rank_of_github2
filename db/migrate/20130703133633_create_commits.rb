class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha
      t.string :html_url
      t.datetime :commit_date
      t.string :committer_name
      t.string :committer_email
      t.datetime :author_date
      t.string :author_name
      t.string :author_email
      t.integer :project_id

      t.timestamps
    end
  end
end
