Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root "homes#top" # ルートディレクトリをトップページに設定
  get "about", to: "homes#about" # アバウトページを表示

  resources :users, only: [:show, :edit, :update] do
    resources :events
  end
  delete "users/:id/out", to: "users#out" # 退会する

  resources :sports, only: [:index]

  get "comment_rooms/:id/comments", to: "comment_rooms#show"
  get "sports/:sport_id/comment_rooms", to: "comment_rooms#index"
  get "sports/:sport_id/comment_rooms/new", to: "comment_rooms#new"
  post "sports/:sport_id/comment_rooms/create", to: "comment_rooms#create"

  post "comment_rooms/:comment_room_id/comments", to: "comments#create"
  delete "comment_rooms/:comment_room_id/comments/:id", to: "comments#destroy"

  resources :comments, only: [:create] do
    resources :likes, only: [:create]
    delete "likes", to: "likes#destroy"
  end

  resources :teams, except: [:index, :new, :create] do
    resources :applicants, except: [:show]
    resources :team_members, only: [:index, :destroy, :new,]
    post "applicants/:id", to: "team_members#create"
    get "applicants/thanks", to: "applicants#thanks" # チーム加入確定画面
  end
  get "teams/information/:id", to: "teams#information" # 連絡事項編集画面

  resources :team_comment_rooms, only: [:abc] do
    resources :team_comments, only: [:create, :destroy]
  end
  get "/team_comment_rooms/:team_comment_room_id/team_comments/:id", to: "team_comment_rooms#show"
  get "/team_comment_rooms/:team_comment_room_id", to: "team_comment_rooms#show"
  get "/team_comment_rooms/:team_comment_room_id/team_comments", to: "team_comment_rooms#show"

  resources :prefectures, only: [:index] do
    resources :sports, only: [:index] do
      resources :teams, only: [:index, :new, :create]
    end
  end

  get 'inquiry/new', to: 'inquiry#new' # 入力画面
  get  'inquiry/confirm', to: 'inquiry#confirm' # 確認画面
  get  'inquiry/thanks', to: 'inquiry#thanks' # 送信完了画面

  resources :messages
  resources :rooms
end
