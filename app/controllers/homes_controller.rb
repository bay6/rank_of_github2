require 'open-uri'
class HomesController < ApplicationController
  before_filter :generate_client

  def index
    @users = ["mouse-lin", "williamherry", "biorainy", "RyanZhu1024"].map do |user|
      @client.user user
    end

    @repos_list = @users.map do |user|
      repos = JSON.parse(open(user.repos_url).read)
      commit_count = repos.inject(0) do |sum, repo|
        num = JSON.parse(open(repo['commits_url'].gsub(/\{.*\}/,'')).read).count rescue 0
        sum += num 
        #TODO please add commit commits.first['commit']['committer']['date']
      end
      {user: user, commit_count: commit_count}
    end
  end

  def generate_client
    @client = Octokit::Client.new(:login => "ken0", :password => "password9")
  end
end
