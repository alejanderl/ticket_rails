TikcetRails::Application.routes.draw do
  

  

  

  get "events_board/show"

  get "events_board/index"
  
  

  resources :shows	
  match 'cities/:city' => 'shows#by_city', :as => :show_by_city

  resources :rooms do
    resources :events do
       get :autocomplete_show_name, :on => :collection
       collection do
	 put :show_serie
       end
    end
  end
 resources :events
  resources :theaters do
    
    resources :rooms
  end
  

  devise_for :users

  resources :selections

  get "ticket/index"

  resources :films do
    get :autocomplete_user_name, :on => :collection
  end
  
  match 'events/:serie_id/show_serie' => 'events#show_serie', :as => :show_event_serie
  match 'events/remove_serie/:serie_id' => 'events#remove_serie', :as => :remove_event_serie
  match 'events/:id' => 'events#show', :as => :event_path
  
  
   resources :address do
     get :autocomplete_city_name, :on => :collection
  end



  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #  	
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
  root to: 'events_board#index', as: 'events_board'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
