Refinery::Application.routes.draw do
  resources :applicants, :only => [:index, :show, :new, :create]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :applicants, :except => :show do
      collection do
        post :update_positions
      end
      member do
        get :activate_campaign
      end
    end
  end
end
