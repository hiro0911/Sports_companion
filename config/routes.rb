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
  
  resources :comment_rooms, only: [:show]
  get "sports/comment_rooms/:id", to: "comment_rooms#index"
  get "sports/comment_rooms/new/:id", to: "comment_rooms#new"
  post "sports/comment_rooms/create/:id", to: "comment_rooms#create"

  resources :comments, only: [:create]
  
  resources :team_comment_rooms, only: [:show]
  get "sports/team_comment_rooms/:id", to: "team_comment_rooms#index"
  get "sports/team_comment_rooms/new/:id", to: "team_comment_rooms#new"
  post "sports/team_comment_rooms/create/:id", to: "team_comment_rooms#create"
  
  resources :team_comments, only: [:create]
end
