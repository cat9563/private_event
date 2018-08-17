class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in user
      flash[:sucess] = "Welcome you've got mail"
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email'
      redirect_to users_new_path
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
