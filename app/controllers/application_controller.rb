class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  protected
    def logged_in?
      session[:reviewer_id]
    end

    def current_user
      current_user ||= Reviewer.find_by(id: session[:reviewer_id])
    end
end
