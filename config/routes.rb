HotelApp::Application.routes.draw do
 
  get "counter_orders/new"

  get "remaining_stocks/show"

  get "internal_orders/new"

  get "internal_orders/show"

  get "salaries/new"

  get "salaries/edit"

  get "salaries/index"

  get "new/edit"

  get "new/index"

  get "attendances/new"

  get "attendances/edit"

  get "attendances/index"

  get "attendances/show"

  get "branches/new"

  get "branches/show"

  get "branches/edit"

  get "positions/new"

  get "positions/show"

  get "positions/edit"

  get "employees/new"

  get "employees/show"

  get "employees/edit"

  get "paid_outs/new"

  get "paid_outs/show"

  get "suppliers/new"

  get "suppliers/show"

  get "suppliers/edit"

  get "transactions/show"

  get "swipe_cards/new"

  get "swipe_cards/edit"

  get "swipe_cards/show"

  get "counters/new"

  get "counters/create"

  get "counters/edit"

  get "counters/show"

  get "taxes/new"

  get "taxes/edit"

  get "taxes/create"

  get "taxes/destroy"

  get "taxes/update"

  get "taxes/show"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  #devise_for :users

devise_for :users,:controllers => { :sessions => "Users" }, :skip => [:registrations]
as :user do
  get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
  put 'users' => 'devise/registrations#update', :as => 'user_registration'
end
  resources :delivery_items
  resources :stock_list_items
  #
  #resources :items
  #resources :categories
  resources :attachments
  


  match '/kitchen' => "kitchens#kitchen"
  match '/billing' => "hotelsessions#billing"
   match '/dashboard' => "hotelsessions#dashboard"
  #match '/tables/new' => "tables#new"
 #resources :hotelsessions
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
   root :to => 'hotelsessions#dashboard'
   

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
   match ':controller(/:action(/:id))(.:format)'
end
