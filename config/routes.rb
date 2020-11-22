Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :restaurants, except: %i[edit, new, show]
      get 'restaurants/show/:id', action: :show, controller: 'restaurants'
      get 'restaurants/statistics', action: :gis, controller: 'statistics'
    end
  end
end
