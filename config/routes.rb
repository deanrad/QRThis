ActionController::Routing::Routes.draw do |map|
  map.resources :slogans
  map.resources :qrcodes

  map.resources :slogans do |slogans|
    slogans.resources :qrcodes
  end
  map.resources :templates do |templates|
    
  end
  
  map.root :controller => 'slogans', :action => 'index'
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end
