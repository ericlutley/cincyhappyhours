class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "public/403.html", :status => :forbidden, :layout => false
  end

  def current_user
    @current_user ||= User.where(:id => session[:user_id]).first
  end
end
