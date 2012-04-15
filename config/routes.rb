Tolk::Engine.routes.draw do
  root :to => 'locales#index'
  resources :locales do
    member do
      get :all
      get :updated
    end
  end

  resource :search

  match "ms_translate" => "ms_translations#translate", :as => :ms_translate, :via => :post

end
