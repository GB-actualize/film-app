class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create( 
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation])

    redirect_to "/games"
  end

end
