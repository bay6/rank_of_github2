class HomesController < ApplicationController

  def index
    @users = User.page(params[:page]).per_page(30)
  end

end
