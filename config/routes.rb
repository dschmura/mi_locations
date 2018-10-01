Rails.application.routes.draw do

  get 'alerts/create'
  get 'alerts/destroy'

  resources :buildings, only: [:show, :index] do
    resources :alerts, module: :buildings
  end

  resources :rooms do
    collection do
      match 'search' => 'rooms#search', via: [:get, :post], as: :search
    end
  end

  get '/project_status', to: 'pages#project_status'
  get '/privacy', to: 'pages#privacy'
  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  root to: 'pages#index'
  get 'pages/index'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/privacy'
  get 'pages/project_status'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources 'feedbacks', only: [:create]
end
