ActionController::Routing::Routes.draw do |map|
  map.resources :slogans
  map.resources :qrcodes

  map.resources :slogans do |slogans|
    slogans.resources :qrcodes
  end

  map.resources :designs
  map.resources :products
  map.resources :user_products
  
  map.root :controller => 'slogans', :action => 'index'
  
  # Make myqrwear.com/craig etc. work
  map.forward ':user', :controller => 'magic', :action => 'index'
  
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end
