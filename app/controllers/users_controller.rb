class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    UserMailer.with(user: @user).welcome_email.deliver_later

    flash[:info] = "You've got mail"
    redirect_to root_url
    else
    render users_new_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
