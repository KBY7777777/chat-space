Rails.application.routes.draw do
  get 'messages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #応用カリNo89の実演にて、indexアクションのroutingを追記
  root "messages#index"

end
