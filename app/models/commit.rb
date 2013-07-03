class Commit < ActiveRecord::Base
  attr_accessible :author_date, :author_id, :author_login, :committer_email, :committer_name, :html_url, :project_id, :sha
end
