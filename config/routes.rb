Rails.application.routes.draw do

  resources :master_materials
  resources :master_groups
  resources :company_groups
  resources :printing_tickets
  resources :companies do
    member do
      get 'verifycompany'
    end
        
    resources :locations do
      resources :projects
    end
    
  end

  resources :locations
  resources :projects


#  devise_for :users
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  
  mount FullCountrySelect::Engine => '/full_country_select'
  root 'main_menus#home'
  
  get 'main_menus/home'

  get 'main_menus/login'

  get 'main_menus/logout'

  get 'main_menus/report'

  get 'main_menus/profile'
  
  get 'users/:company_id/sign_up' => 'devise/registrations#new', as: :admin_user_registration

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the mount FullCountrySelect::Engine => '/full_country_select'
  #  root of your site routed with "mount FullCountrySelect::Engine => '/full_country_select'root"
  # mount FullCountrySelect::Engine => '/full_country_select'
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
  
  match ':controller(/:action(/:id(.:format)))', :via => [:get, :post, :delete, :patch, :put]
  
end
