FactuurApp::Application.routes.draw do
<<<<<<< HEAD
  resources :contacts
=======
<<<<<<< HEAD
  resources :products, only: [:create, :destroy]

=======
  get "contacts/new"
>>>>>>> 3188f478a0500e916ac1e9e4f6649eb451e2d3e5
>>>>>>> f1e3185b312ec958aa852a55d3a47be0cb8dea6d
  root 'static_pages#home'
  #deze match is misschien overbodig: match 'newcontact', to: 'contacts#new',       via: 'get'
  match 'home',       to: 'static_pages#home',  via: 'get'
  match 'myproducts', to: 'products#show',      via: 'get'
  match 'newproduct', to: 'products#new',       via: 'get'
  match 'newproduct', to: 'products#create',       via: 'post'
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
