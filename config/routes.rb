Rails.application.routes.draw do
  resources :posts
  devise_for :users
  if Rails.env == "development" || Rails.env == "production"
    @root_user = User.all.where("first_name = ? AND last_name = ?", "Ian", "MacDonald").first
  #
  #   root to: "users#show", id: @root_user.id, :as => "/"
  #
  #   get "/" => "users#show", id: @root_user.id, :as => "/"
  #   get "users/:id" => redirect("/"), as: :user
    root to: "users#show", id: @root_user.id
  elsif
    root to: "users#index"
  end

  resources :users, except: ['new', 'create', 'edit', 'update']
  resources :categories
  resources :projects

end
