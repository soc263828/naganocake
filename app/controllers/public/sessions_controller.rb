# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  #before_action :authenticate_customer!
  before_action :customer_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]
  def after_sign_in_path_for(resource)
    root_path
  end


  def after_sign_up_path_for(resource)
    customers_show_path
  end
protected
def customer_state
  @customer = Customer.find_by(email: params[:customer][:email])
  return if !@customer
  if @customer.valid_password?(params[:customer][:password])
    if @customer.is_deleted == true
      redirect_to new_customer_registration_path
    end

  end
end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   #def create
     #redirect_to root_path
   #end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
