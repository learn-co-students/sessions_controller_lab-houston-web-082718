class SessionsController < ApplicationController

  def new

  end

  def create

      if params[:name].present? && params[:name].length > 0
        session[:name] = params[:name]
        redirect_to root_path
      else
        redirect_to sessions_new_path
      end

  end

  def destroy
    session.delete :name
    redirect_to login_path
  end

end
