FinalApp::Application.routes.draw do
  root 'users#newsfeed'
  get "shared/_error_messages"

  get "friendships/find"

  get "friendships/create"

  get "friendships/new"


  resources :session, only: [:new, :create, :destroy]
  match '/login',  to: 'session#new',   via: 'get'
  match '/login', to: 'session#create', via: 'post'
  match '/login',  to: 'session#destroy',   via: 'delete'
  resources :users, :except => [:edit, :destroy, :index]
  match '/register',  to: 'users#new',   via: 'get'
  match '/newsfeed', to: 'users#newsfeed', via: 'get'
  match '/findfriends', to: 'friendships#find', via: 'get'
  match '/preferences', to: 'users#preferences', via: 'get'
  resources :posts
  match '/posts',  to: 'posts#create',   via: 'post'
  match '/posts',  to: 'posts#destroyall',   via: 'delete'
  resources :friendships, :except => [:show, :edit, :index]

  # The priority is based upon order of creation:
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
