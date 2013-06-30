class HomesController < ApplicationController

  before_filter :authenticate_member!
  
  def index
    @users = User.page(params[:page]).per(800)
  end

end
