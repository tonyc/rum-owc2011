Refinery::Application.routes.draw do
  resources :payments, :only => [:index, :show]

  match 'confirm' => 'payments#confirm', :as => :confirmation
  match 'refinery/payments/contact_ajax' => 'admin/payments#cntact_ajax'
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :payments, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
