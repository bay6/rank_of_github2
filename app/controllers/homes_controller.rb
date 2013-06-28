class HomesController < ApplicationController

  def index
    @users = User.page(params[:page]).per(30)
  end

end
