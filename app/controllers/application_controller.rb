class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  # before_filter :authorize_amin
  # check_authorization
  protect_from_forgery
  def authorize_amin
    user = current_user
    if (user.user_role.role != 0)
       redirect_to menu_url, notice: "没权限"
    end
  end
  
  rescue_from CanCan::AccessDenied do |exception|
      redirect_to menu_url, :alert => exception.message
  end
    
end
