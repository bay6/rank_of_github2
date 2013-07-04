class Commit < ActiveRecord::Base
  attr_accessible :commit_date, :author_id, :author_login, :committer_email, :committer_name, :html_url, :project_id, :sha, :project
  belongs_to :project

  def self.get_commit_from repo
    @client = Octokit::Client.new(:login => "ken0", :password => "password9")
    all_commits = []
    commits = []
    last_commit =  @client.commits("#{repo.owner.login}/#{repo.name}").first
    begin
      commits = @client.commits("#{repo.owner.login}/#{repo.name}", 'master', {per_page: 100, sha: last_commit.sha})
      last_commit = commits.last
      all_commits += commits
    end unless commits.count < 100
    all_commits.each{|commit| create_or_update(commit, repo)}
  end

  protected
  def self.create_or_update commit, repo
    local_commit = Commit.find_or_create_by_sha commit.sha
    author = commit.author || commit.committer
    if author.nil?
      author_id = nil
      author_login = commit.commit.author.name
    end
    local_commit.update_attributes(
      commit_date: commit.commit.author.date,
      author_id: author_id,
      author_login: author_login,
      committer_email: commit.commit.author.email,
      committer_name: commit.commit.author.name,
      html_url: commit.html_url,
      project: Project.find_by_uid(repo.id)#should be project_id
    )
  end
end
