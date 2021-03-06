class Commit < ActiveRecord::Base
  attr_accessible :commit_date, :committer_email, :committer_name, :html_url, :project_id, :sha, :project, :author_date, :author_name, :author_email
  belongs_to :project

  def self.get_commit_from repo
    @client = Octokit::Client.new(:login => "ken0", :password => "password9")
    all_commits = []
    commits = Array.new(100)
    last_commit =  @client.commits("#{repo.owner.login}/#{repo.name}").first
    begin
      commits = @client.commits("#{repo.owner.login}/#{repo.name}", 'master', {per_page: 100, sha: last_commit.sha})
      last_commit = commits.last
      all_commits += commits
    end until commits.count < 100
    all_commits.each{|commit| create_or_update(commit, repo)}
  end

  protected
  def self.create_or_update commit, repo
    local_commit = Commit.find_or_create_by_sha commit.sha
    local_commit.update_attributes(
      author_date: commit.commit.author.date,
      author_email: commit.commit.author.email,
      author_name: commit.commit.author.name,
      commit_date: commit.commit.committer.date,
      committer_email: commit.commit.author.email,
      committer_name: commit.commit.author.name,
      html_url: commit.html_url,
      project: Project.find_by_uid(repo.id)#should be project_id
    )
  end
end
