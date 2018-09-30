class SessionsController < ApplicationController
  def index
    @logged_in = session[:name]
  end

  def new
    render :new
  end

  def create
    if session[:name] # already logged in?
      redirect_to "/"
    else
      if !params[:name] || params[:name] == ""
        redirect_to new_session_path
      else
        session[:name] = params[:name]
        redirect_to :root
      end
    end
  end

  def destroy
    session[:name] = nil
    redirect_to :root
  end
end