Rails.application.routes.draw do
  if Rails.env == "development"
    @root_profile = Profile.all.where("first_name = ? AND last_name = ?", "Ian", "MacDonald").first

    root to: "profiles#show", id: @root_profile.id, :as => "/"

    get "/" => "profiles#show", id: @root_profile.id, :as => "/"
    get "profiles/:id" => redirect("/"), as: :profile
  else
    root to: "profiles#index"
  end

  resources :profiles
  resources :categories
  resources :projects

end
