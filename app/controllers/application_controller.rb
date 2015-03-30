class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login

  around_filter :scope_current_tenant

  private
  
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

  def current_tenant
    Tenant.find_by_subdomain! request.subdomain
  end
  helper_method :current_tenant

  def scope_current_tenant
    Tenant.current_id = current_tenant.id
    yield
  ensure
    Tenant.current_id = nil
  end
end