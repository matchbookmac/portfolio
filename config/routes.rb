Rails.application.routes.draw do
  # if Rails.env == "development"
  #   @root_user = User.all.where("first_name = ? AND last_name = ?", "Ian", "MacDonald").first
  #
  #   root to: "users#show", id: @root_user.id, :as => "/"
  #
  #   get "/" => "users#show", id: @root_user.id, :as => "/"
  #   get "users/:id" => redirect("/"), as: :user
  # else
    root to: "users#index"
  # end

  resources :users
  resources :categories
  resources :projects

end
