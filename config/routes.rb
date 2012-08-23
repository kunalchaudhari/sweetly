Sweetly::Application.routes.draw do
  resources :categories

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  match 'partners' => 'partners#create', :via => 'post'
  match 'partners' => 'home#partners'
  match 'contact' => 'home#contact'
  match 'privacy' => 'home#privacy'
  match 'terms' => 'home#terms'
  match 'about' => 'home#about'
  match 'designers' => 'home#designers'
  match 'goodwillband' => 'home#goodwillband'
  match 'showcase' => 'home#showcase'
  match 'reload_showcase(/:id)' => 'home#reload_showcase'
  match 'models' => 'home#models'
  match 'story' => 'home#story'
  match 'materials' => 'home#materials'

  root :to => 'home#index'
end
