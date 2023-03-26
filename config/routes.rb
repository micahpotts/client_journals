Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope '/providers', only: [:create, :index, :show] do
    # post '/', to: 'providers#create'
    get '/', to: 'providers#index'
    get '/:id', to: 'providers#show'
    get ':id/clients', to: 'clients#show'
    get ':id/journal_entries', to: 'journal_entries#show_by_provider'
  end
#
  #scope '/clients' do
    #get '/:id', to: 'clients#show'
    #get '/:id/providers', to: 'providers#show'
    #get '/:id/journal_entries', to: 'journal_entries#show'
  #end

  #resources :providers, only: [:create]
  resources :clients

  #resources :providers do
    #resources :clients
      #resources :journal_entries
  #end
end
