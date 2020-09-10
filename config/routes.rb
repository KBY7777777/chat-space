Rails.application.routes.draw do
  devise_for :users
  #下記で「root〜」を設定したので、「get 'messages/index'」は削除した（コードreviewでご指摘を受けて）。
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #応用カリNo89の実演にて、indexアクションのroutingを追記
  # root "messages#index"
  #応用カリNo91にて、rootパスではside-bar部分のみの表示とするため、groups#indexアクションのroutingに修正
  root "groups#index"

  #応用カリNo90の実演にて、editアクションとupdateアクションのroutingを追記
  #（rootパスは、前単元で上記のとおり記載済み）
  #応用カリNo109にて、indexアクションのroutingを追記
  resources :users, only: [:index, :edit, :update]

  #応用カリNo91にて、groupsコントローラーに対するnewアクションとcreateアクションのroutingを追記
  #グループ情報編集機能の実装につき、editアクションとupdateアクションのroutingを追記
  #さらに、トップ画面の実装につき、indexアクションのroutingを追記
  #さらに、messagesコントローラーに対してcreateアクションのroutingを追記し、indexはmessagesに再設定
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
    #応用No110にて、WebAPIとしたcontrollerでのアクションを実行する下記のroutingを追記
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end

end
