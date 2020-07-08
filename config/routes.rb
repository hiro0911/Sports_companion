Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "homes#top" # ルートディレクトリをトップページに設定
  get "about", to: "homes#about" # アバウトページを表示

  resources :users, only: [:show, :edit, :update]
  get "users/quit", to: "users#quit" # 退会画面
  delete "users/out", to: "users#out" # 退会する

  resources :teams
  get "teams/prefectures", to: "teams#prefectures" # 都道府県選択画面
  get "teams/information", to: "teams#information" # 連絡事項編集画面

  resources :team_members, only: [:index, :new, :create, :destroy]
  get "team_members/thanks", to: "team_members#thanks" # チーム加入確定画面

  resources :sports, only: [:index]
  resources :comment_rooms, only: [:create]
  resources :comments, only: [:index, :create]
  resources :team_comment_rooms, only: [:create]
  resources :team_comments, only: [:index, :create]
end
