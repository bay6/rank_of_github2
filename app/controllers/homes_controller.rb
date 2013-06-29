class HomesController < ApplicationController

  def index
    @users = User.page(params[:page]).per(800)
  end

end
