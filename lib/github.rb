module Github

  def self.all_repo
    @client.repos( 'bay6')
  end

  #def self.all_commits repo
  #@client.commits("#{repo.owner.login}/#{repo.name}")
  #end

  def self.all_commits
    @client.repos('bay6').each{|repo| Commit.get_commit_from repo}
  end

  class Repo
  end

  require 'open-uri'
  class Commit1 < ActiveRecord::Base
    attr_accessible :commit_date, :author_id, :author_login, :committer_email, :committer_name, :html_url, :project_id, :sha, :project
    belongs_to :project

    def self.get_commit_from repo
      @client = Octokit::Client.new(:login => "ken0", :password => "password9")
      #all_commits = []
      #commits = []
      #page = 1
      #begin 
      #binding.pry
      ##commits = JSON.parse(open("https://api.github.com/repos/#{repo.owner.login}/#{repo.name}/commits?page=#{page}&per_page=10").read)
      #commits = JSON.parse(open("https://api.github.com/repos/bay6/union/commits?page=3&per_page=20&client_id=aba3f4a733d0f57f8c54&client_secret=eab0b789e692af442db20f6a7a2ee2ed2b9d49f2").read)
      commits = @client.commits("#{repo.owner.login}/#{repo.name}", 'master', {per_page: 1000})#, since: 10.days.ago})
      #all_commits += commits
      #page += 1
      #end while commits.count == 100
      #all_commits.each{|commit| create_or_update(commit, repo)}
      commits.each{|commit| create_or_update(commit, repo)}
    end

    protected
    def self.create_or_update commit, repo
      local_commit = Commit.find_or_create_by_sha commit['sha']
      author = commit['author'] || commit['committer']
      if author.nil?
        author_id = nil
        author_login = commit['commit']['author']['name']
      end
      local_commit.update_attributes(
        commit_date: commit['commit']['author']['date'],
        author_id: author_id,
        author_login: author_login,
        committer_email: commit['commit']['author']['email'],
        committer_name: commit['commit']['author']['name'],
        html_url: commit['html_url'],
        project: Project.find_by_uid(repo.id)#should be project_id
      )
    end
  end

end


