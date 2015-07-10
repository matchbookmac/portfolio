Rails.application.routes.draw do
  devise_for :users
  # if Rails.env == "development"
    @root_user = User.all.where("first_name = ? AND last_name = ?", "Ian", "MacDonald").first
  #
  #   root to: "users#show", id: @root_user.id, :as => "/"
  #
  #   get "/" => "users#show", id: @root_user.id, :as => "/"
  #   get "users/:id" => redirect("/"), as: :user
  # else
    root to: "users#show", id: @root_user.id
  # end

  resources :users, except: ['new', 'create']
  resources :categories
  resources :projects

end
