class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credential(
      param[:user][:username],
      param[:user][:password]
    )

    if @user
      login(@user)
      render "api/users/show"
    else
      render json: ['Invalid Credentials!'], status: 401
    end
  end


  def destroy
    if current_user
      log_out
      render "api/users/show"
    else
      render json: ["you've been logged out"], status: 404
    end
  end

end
