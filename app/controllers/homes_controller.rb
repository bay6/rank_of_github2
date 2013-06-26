class HomesController < ApplicationController

  def index
    @users = ["mouse-lin", "williamherry", "biorainy", "RyanZhu1024"].map do |user|
      Octokit.user user
    end
  end

end
