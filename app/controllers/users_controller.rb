class UsersController < ApplicationController
 # before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def update
    if current_user.update(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_registration_path(current_user)
    else
      flash[:error] = "An error occured. Please try again."
      render "devise/registration/edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
  
  #def configure_permitted_parameters
  #  devise_parameter_sanitizer.for(:sign_up){|u| u.permit(:name, :avatar}
  #end
end
