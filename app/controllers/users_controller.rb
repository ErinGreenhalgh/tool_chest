class UsersController < ApplicationController
  def show

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:update] = "You have updated your user information"
      session[:user_id] = @user.id 
      redirect_to @user
    else
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
