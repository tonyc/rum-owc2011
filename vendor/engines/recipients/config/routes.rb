Refinery::Application.routes.draw do
  resources :recipients, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :recipients, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
