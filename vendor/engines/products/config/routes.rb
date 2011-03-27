Refinery::Application.routes.draw do
  resources :products, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :products, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
