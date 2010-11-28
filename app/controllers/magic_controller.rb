class MagicController < ActionController::Base
  def index
    redirect_to "/?#{params[:user]}"
  end
end