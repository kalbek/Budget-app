Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :groups, only: [:new, :create, :destroy]
  resources :entities, only: [:new, :create, :destroy]

  devise_for :users

  # Defines the root path route ("/")
  # root to: 'groups#index'
  root to: 'splash#index'

  # categories route
  get 'transactions', to: 'transactions#index', as: :transactions

  # User recipes route
  get 'payments', to: 'payments#index', as: :payments

  # new payments path
  get 'new_payments', to: 'payments#new', as: :new_payment

  # Specific transaction route
  get 'transactions/:id', to: 'transactions#show', as: :transaction

  # Specific transaction route
  get 'new_transactions', to: 'transactions#new', as: :new_transaction

end
