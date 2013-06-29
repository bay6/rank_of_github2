class HomesController < ApplicationController

  def index
    @users = User.page(params[:page]).per(20)
  end

end
