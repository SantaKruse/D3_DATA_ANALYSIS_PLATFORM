Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'viz_ones#index'

    resources :viz_ones, only: [:index] do
      collection do
        post :search
      end
    end

end
