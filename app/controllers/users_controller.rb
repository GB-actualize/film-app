class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create( 
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation])

    if user.save
      session[:user_id] = user.id
      flash[:success] = "User created"
      redirect_to "/games"
    else
      flash[:danger] = "User not saved, try again"
      redirect_to "/signup"
    end
  end

end
