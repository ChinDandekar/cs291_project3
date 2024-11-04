class SessionsController < ApplicationController
  def new
  end

  def create
    author = Author.find_by(username: params[:username])
    if !author
      author = Author.new(username: params[:username])
      author.save()
    end

    session[:author_id] = author.id
    redirect_to root_path, notice: "Logged in successfully"
  end

  def destroy
    session[:author_id] = nil
    redirect_to login_path, notice: "Logged out successfully"
  end
end
