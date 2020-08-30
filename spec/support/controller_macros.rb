#応用カリNo98にて、deviseを用いてテストを実施するための準備

module ControllerMacros
  def login(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end
end
