RumOwc2011::Application.routes.draw do
  match '/admin', :to => 'admin/dashboard#index', :as => :admin
end
