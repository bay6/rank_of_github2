require 'open-uri'
class HomesController < ApplicationController
  before_filter :generate_client

  def index
    @users = User.page(params[:page]).per_page(30)
  end

  def generate_client
    @client = Octokit::Client.new(:login => "ken0", :password => "password9")
  end
end
