class Api::SessionController < ApplicationController

  def create
    @user = User.find_by_credential(
      param[user][username],
      param[user][password]
    )

    if @user
      login(@user)
    else
      flash[:errors] = ['Invalid Credentials!']
    end
  end


  def destroy
    log_out
  end

end
