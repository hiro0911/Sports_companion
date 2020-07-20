Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root "homes#top" # ルートディレクトリをトップページに設定
  get "about", to: "homes#about" # アバウトページを表示

  resources :users, only: [:show, :edit, :update] do
  	resources :events
  end
  get "users/quit", to: "users#quit" # 退会画面
  delete "users/out", to: "users#out" # 退会する

  resources :team_members, only: [:destroy]
  get "team_members/:id", to: "team_members#index"


  resources :sports, only: [:index]
  
  get "comment_rooms/:id", to: "comment_rooms#show"
  get "sports/:sport_id/comment_rooms", to: "comment_rooms#index"
  get "sports/:sport_id/comment_rooms/new", to: "comment_rooms#new"
  post "sports/:sport_id/comment_rooms/create", to: "comment_rooms#create"

  resources :comments, only: [:create] do
  	resources :likes, only:[:create]
  	delete "likes", to: "likes#destroy"
  end
  
  resources :teams, except: [:index, :new, :create] do
  	resources :team_members, only: [:new, :create]
  	get "team_members/thanks", to: "team_members#thanks" # チーム加入確定画面
  end
  get "teams/information/:id", to: "teams#information" # 連絡事項編集画面

  resources :team_comment_rooms, only: [:show]
  	  


  resources :prefectures, only: [:index] do
	  resources :sports, only: [:index] do
	  	 resources :teams, only: [:index, :new, :create]
	  end
	end
  
  resources :team_comments, only: [:create]


end
