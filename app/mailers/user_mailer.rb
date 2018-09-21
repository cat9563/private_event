class UserMailer < ApplicationMailer
  default from: 'eventsorg@example.com'

  def welcome_email
    @user = params[:user]
    @url = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Welcome to our community, enjoy!!')
  end
end
