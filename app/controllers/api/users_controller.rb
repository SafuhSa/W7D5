class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_param)
    if @user.save
      login(@user)
    else
      flash[:errors] = @user.errors.full_messages
    end

  end

  private

  def user_param
    params.require(:user).permit(:username, :password)
  end


end
