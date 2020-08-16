class ApplicationController < ActionController::Base

  #応用カリNo90の実演にて、SignUp用のアクションを追記
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #サインアップ時に入力された「name」キーの内容の保存を許可するアクション設定
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
