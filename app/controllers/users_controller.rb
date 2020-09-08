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

  #応用カリNo109にて、indexアクションを追記
  def index
    #さらに、下記コードを追記
    return nil if params[:keyword] == ""
    @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
    respond_to do |format|
      # format.html  #「htmlをレスポンスとするコードを削除しても問題ないか」の動作確認で削除した
      format.json  #サーバーはJSON形式で値を返し、jbuilderファイルが読み込まれるように
    end
  end

  private

  #応用カリNo90にて、user情報のparams定義を追記
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
