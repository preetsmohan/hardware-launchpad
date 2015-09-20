Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :hardwares
  #get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  root to: 'main#index'

  get 'users/:id' => 'users#view'
  get 'new_checkout' => 'users#checkout'
  post 'new_checkout' => 'users#checkout_submission'
  get 'inventory' => 'main#inventory'
  get 'charge' => 'braintree#charge'
  post 'charge' => 'braintree#charge_post'

  # Braintree stuff
  get "/client_token" => 'braintree#client_token'
  post '/checkout' => 'braintree#checkout'
  post '/update_credit' => 'braintree#update_credit'
  #get "/client_token" do
  #  Braintree::ClientToken.generate
  #end

  #post "/checkout" do
  #  nonce = params[:payment_method_nonce]
    # Use payment method nonce here...
  #end


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
