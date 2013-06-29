class HomesController < ApplicationController

  def index
    @users = User.page(params[:page]).per(500)
  end

end
