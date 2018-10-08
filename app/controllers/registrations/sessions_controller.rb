# frozen_string_literal: true

class Registrations::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  # def create
  #   super
  #   session[:current_user_id] = user.id
  #   redirect_to root_url
  #   if params[:remember_name]
  #     cookies[:first_name] = @user.first_name
  #     cookies[:login] = { value: "XJ-122", expires: 5.seconds.from_now }
  #   else
  #     cookies.delete(:first_name)
  #   end
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  #   session.delete(:current_user_id)
  #   @_current_user = nil
  #   redirect_to root_url
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
