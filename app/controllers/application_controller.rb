class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  # before_filter :authorize_amin
  protect_from_forgery
  def authorize_amin
    user = current_user
    # if user.user_role
#       if (user.user_role.role != 0)
#          redirect_to menu_url, notice: "没权限"
#       end
#     else
#       redirect_to menu_url, notice: "没权限"
#     end
      if (user.user_role.role != 0)
         redirect_to menu_url, notice: "没权限"
      end
  end
end
