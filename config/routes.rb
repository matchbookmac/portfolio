Rails.application.routes.draw do
  @root_profile = Profile.all.where("first_name = ? AND last_name = ?", "Ian", "MacDonald").first

  root to: "profiles#show", id: @root_profile.id

  resources :profiles
  resources :categories
  resources :projects
end
