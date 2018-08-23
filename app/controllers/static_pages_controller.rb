class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.events.build if logged_in?
  end
end
