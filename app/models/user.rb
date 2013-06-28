require 'open-uri'
class User < ActiveRecord::Base
   has_many :contributes

   # for 500 users
   def self.fetch_china_datas
     @users = 5.times.collect { |page| search_users("location:china", page + 1) }.flatten
     save_users
   end

   # for 100 users
   def self.fetch_world_datas
     search_users
     save_users
   end

   private

   class << self

     def save_users
       @users.each do |user|
         exist_user = User.find_by_github_id user.id
         user.merge! more_datas user.username
         params = { 
           name: user.name,
           login: user.login,
           followers: user.followers,
           avatar_url: user.avatar_url,
           github_id: user.id,
           fullname: user.fullname,
           location: user.location,
           language: user.language,
           username: user.username,
           score: user.score 
         }
         if exist_user
           exist_user.update_attributes! params
         else
           exist_user = User.create! params.merge!(github_id: user.id)
         end
         if user.contributes.nil? || (!user.contributes.pluck(:score).include? user.contribute)
           Contribute.create!({ 
             user_id: exist_user.id,
             score: user.contribute
           })
         end
       end
     end

     def more_datas username
       doc = Nokogiri::HTML open("https://github.com/#{ username }")
       contribute = doc.at(".contrib-day>.num").text.sub!(" Total", "").to_f
       avatar_url = doc.at(".avatared img")["src"]
       { contribute: contribute, avatar_url: avatar_url }
     end

     def search_users keyword=nil, page=1
       keyword ||= "followers:>0"
       Octokit.search_users keyword, { sort: "followers", order: "desc", start_page: page, force_urlencoded: true } 
     end

     #TODO for fetch and get all user's commit 
     def get_commit
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

end
