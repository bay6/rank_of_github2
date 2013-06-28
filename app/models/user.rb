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
   end

   private

   class << self

    def save_users
      @users.each do |user|
        exist_user = User.find_by_github_id user.id
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
          user.update_attributes! params
        else
          User.create! params.merge!(github_id: user.id)
        end
      end
    end

    def search_users keyword=nil, page=1
      keyword ||= "followers:>0"
      Octokit.search_users keyword, { sort: "followers", order: "desc", start_page: page, force_urlencoded: true } 
    end

   end

end
