class UsersController < ApplicationController

  #応用カリNo90にて、editアクションを追記
  def edit
  end

  #応用カリNo90にて、updateアクションを追記
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  #応用カリNo90にて、user情報のparams定義を追記
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
