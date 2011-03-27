Refinery::Application.routes.draw do
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    match 'contacts/import' => 'contacts#import'
    resources :contacts, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
