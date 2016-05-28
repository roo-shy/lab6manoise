Rails.application.routes.draw do
  root 'home#index'
  get '/users/new' => 'users#new', as: :new_user
  get '/users' => 'users#index', as: :users
  get '/users/:id/profile' => 'users#show', as: :user
  post '/users' => 'users#create'

  get 'manoise/:id' => 'manoise#detail', as: :manoise
  get 'newmanoises' => 'manoises#new', as: :new
  post 'manoises/dashbord' => 'manoises#create', as: :manoises

  get 'sign_in' => 'session#new', as: :sign_in
  post 'sign_in' => 'session#create'
  delete 'sign_out' => 'session#delete', as: :sign_out

  get 'dashboard' => 'home#dashboard', as: :dashboard

  post 'user/:id/follow' => 'follow#create', as: :follow_user
  post 'user/:id/stop-follow' => 'follow#delete', as: :stop_follow_user


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
