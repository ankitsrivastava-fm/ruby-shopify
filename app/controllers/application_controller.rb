class ApplicationController < ActionController::Base
  before_action :set_current_tenant

  private
  def set_current_tenant
    if user_signed_in?
      @current_tenant = current_user.tenant
    end
  end

end
