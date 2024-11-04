class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  helper_method :current_author, :logged_in?

  def current_author
    @current_author ||= Author.find(session[:author_id]) if session[:author_id]
  end

  def logged_in?
    !!current_author
  end

  def require_author
    redirect_to login_path unless logged_in?
  end

  allow_browser versions: :modern
end
