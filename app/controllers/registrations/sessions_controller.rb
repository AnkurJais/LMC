class Registrations::SessionsController < Devise::SessionsController
before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    user=User.find_by(:email => params[:user][:email])
    if (user.has_role? "admin") && (params[:action_name] == "index_user")
      set_flash_message :alert, :standard_login
      redirect_to '/index-admin'
    elsif (user.has_role? "standard") && (params[:action_name] == "index_admin")
      redirect_to '/index-user'
    else
      super
    end  
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :attribute
  end
end
