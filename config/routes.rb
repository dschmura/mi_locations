Rails.application.routes.draw do
  # get 'alerts/create'
  # get 'alerts/destroy'
  # get 'alerts/index'
  # get 'alerts/new'
  resources :alerts
  resources :buildings, only: [:show, :index, :update] do
    resources :floors
    resources :alerts, module: :buildings
    collection do
      match "search" => "buildings#search", :via => [:get, :post], :as => :search
    end
  end

  resources :rooms, only: [:show, :index, :update] do
    resources :alerts, module: :rooms
    collection do
      match "search" => "rooms#search", :via => [:get, :post], :as => :search

    end
  end
  match "toggle_visibility/:id" => "rooms#toggle_visibility", :via => [:get, :post], :as => :toggle_visibility

  resources :classrooms, only: [:show, :index] do
    collection do
      match "search" => "classrooms#search", :via => [:get, :post], :as => :search
    end
  end

  get "/project_status", to: "pages#project_status"
  get "/privacy", to: "pages#privacy"
  get "/contact", to: "pages#contact"
  get "/about", to: "pages#about"
  root to: "pages#index"
  get "pages/index"
  get "pages/about"
  get "pages/contact"
  get "pages/privacy"
  get "pages/project_status"
  get "lsa" => redirect("https://lsa.umich.edu")
  get "lsa_tech_services" => redirect("https://lsa.umich.edu/technology-services")
  get "about_iss" => redirect("https://lsa.umich.edu")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources "feedbacks", only: [:create]
end
