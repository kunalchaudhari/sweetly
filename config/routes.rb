Sweetly::Application.routes.draw do
  resources :albums

  resources :photos

  resources :picasa_photos

  resources :picasa_albums

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :notification_emails
  resources :subscriptions
  match 'partners' => 'partners#create', :via => 'post'
  match 'partners' => 'home#partners'

  root :to => 'home#index'

  match 'wholesalepartner' => 'home#partner'
  match 'sjs' => 'home#sjs'
  match 'contact' => 'home#contact'
  match 'privacy' => 'home#privacy'
  match 'terms' => 'home#terms'
  match 'about' => 'home#about'
  match 'howitworks' => 'home#howitworks'
  match 'getinvolve' => 'home#getinvolve'
  match 'designers' => 'home#designers'
  match 'goodwillband' => 'home#goodwillband'
  # The priority is based upon order of creation:
  match 'showcase' => 'home#showcase'
  match 'reload_showcase(/:id)' => 'home#reload_showcase'
  match 'models' => 'home#models'
  match 'story' => 'home#story'
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
