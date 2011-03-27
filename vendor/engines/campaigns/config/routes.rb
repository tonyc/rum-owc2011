Refinery::Application.routes.draw do
  resources :campaigns, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :campaigns, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
