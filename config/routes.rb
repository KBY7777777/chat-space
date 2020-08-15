Rails.application.routes.draw do
  #下記で「root〜」を設定したので、「get 'messages/index'」は削除した（コードreviewでご指摘を受けて）。
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #応用カリNo89の実演にて、indexアクションのroutingを追記
  root "messages#index"

end
