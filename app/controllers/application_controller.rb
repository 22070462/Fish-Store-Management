class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user! # Ensures the user is signed in before accessing any page

  # Restrict access to admin panel for non-admin users
  before_action :restrict_admin_access, if: :admin_area?

  # Redirect after sign in based on user role (admin or non-admin)
  def after_sign_in_path_for(resource)
    if current_user.admin?
      rails_admin_path # Admin user will be redirected to the Rails Admin dashboard
    else
      root_path # Non-admin users will be redirected to the home page
    end
  end

  protected

  # Permitting additional parameters for Devise, like :name
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  # Only restrict admin access if it's the admin panel route
  def admin_area?
    request.path.start_with?('/admin') # Adjust if necessary, this is checking for `/admin` routes
  end

  # Redirect non-admin users trying to access admin section
  def restrict_admin_access
    redirect_to root_path, alert: "You are not authorized to view this page." unless current_user.admin?
  end
end
