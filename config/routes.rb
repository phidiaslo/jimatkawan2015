Rails.application.routes.draw do

  resources :shiplocations

  resources :images

  get 'listings/update_subcategories', :as => 'update_subcategories'

  resources :listings do
    collection do
      match 'search' => 'listings#search', via: [:get, :post], as: :search
    end
  end

  resources :locations

  resources :subcategories

  resources :categories

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :users, only: [:index, :show, :edit, :update]
  # You can have the root of your site routed with "root"

  resources :shops, except: [:show] #Remove Controller Name in Show action
  get '/:id' => 'shops#show', as: :store #Remove Controller Name in Show action
  get '/:id/about' => 'shops#about', as: :shop_about
  get '/:id/policies' => 'shops#policy', as: :shop_policy
  get '/:id/reviews' => 'shops#reviews', as: :shop_reviews

  
  root 'welcome#index'

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