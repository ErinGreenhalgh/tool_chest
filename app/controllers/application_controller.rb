class ApplicationController < ActionController::Base
  helper_method :most_recent_tool, :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def most_recent_tool
    if current_user && current_user.tools.exists?
      current_user.tools.last
    else
      Tool.new(name: "You currently do not have any tools")
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
