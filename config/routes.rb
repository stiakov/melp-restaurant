Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :restaurants, except: %i[edit, new]
      get 'statistics', action: :gis, controller: 'statistics'
    end
  end
end
