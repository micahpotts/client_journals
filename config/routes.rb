Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope '/providers', only: [:create, :index, :show] do
    get '/', to: 'providers#index'
    get '/:id', to: 'providers#show'
    get '/:id/clients', to: 'clients#show_by_provider'
    get '/:id/journal_entries', to: 'journal_entries#show_by_provider'
    post '/', to: 'providers#create'
    patch ':id/clients', to: 'providers#update_clients'
  end

  scope '/clients' do
    get '/', to: 'clients#index'
    get '/:id', to: 'clients#show'
    get '/:id/providers', to: 'providers#show_by_client'
    get '/:id/journal_entries', to: 'journal_entries#show_by_client'
    post '/', to: 'clients#create'
    patch '/:id/providers', to: 'clients#update_providers'
  end

  resources :journal_entries
end
