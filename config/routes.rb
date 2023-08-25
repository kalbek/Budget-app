Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  devise_for :users

  # The root path will be spash screen
  root to: 'splash#index'

  # expenses route
  get 'expenses', to: 'expenses#index', as: :expenses
  
  # Specific expense route
  get 'expenses/:id', to: 'expenses#show', as: :expense

  # Payments under specific expense
  get 'expenses/:id/payments', to: 'payments#index', as: :payments

  # Specific payment path
  get 'expenses/:id/payments/:id', to: 'payments#show', as: :payment

  # new payments path
  get 'new_payments', to: 'payments#new', as: :new_payment

  # Specific expense route
  get 'new_expenses', to: 'expenses#new', as: :new_expense

  resources :expenses do
    resources :payments, only: [:new, :create]
  end
end
