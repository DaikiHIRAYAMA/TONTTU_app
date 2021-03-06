# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update, :show]
   before_action :authenticate_user! , only: [:show]

  # before_action :correct_user, only: [:show]
  # GET /resource/sign_up
   def new
     super
   end

  # POST /resource
   def create
     super
   end

  # GET /resource/edit
   def edit
     super
   end

  # PUT /resource
   def update
     super
   end

  # DELETE /resource
   def destroy
     super
   end

   def show
    @user = User.where(user_id: current_user.id)
   end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
   def cancel
     super
   end

   private

   def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def sauna_params
    params.require(:sauna).permit(:name, :sauna_temperature, :sauna_humidity, :water_temperature, :user_id)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to current_user unless current_user?(@user)
  end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
   end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:attribute],)
   end

  # The path used after sign up.
   def after_sign_up_path_for(resource)
    new_sauna_path(resource)
   end

  # The path used after sign up for inactive accounts.
   def after_inactive_sign_up_path_for(resource)
     super(resource)
   end
end
