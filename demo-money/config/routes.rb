Rails.application.routes.draw do

  # Session
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  get 'logout', to: 'session#destroy'

  # User
  get 'register', to: 'users#new'
  post 'users', to: 'users#create'

  # Transaction
  get 'transactions/debt', to:'transactions#debt', as: 'debt'
  get 'transactions/credit', to:'transactions#credit', as: 'credit'
  get 'transactions/history', to:'transactions#history', as: 'history'
  get 'transactions/new', to:'transactions#new', as: 'new_transaction'
  # post 'transactions', to:'transactions#create'
  post 'transactions/new', to:'transactions#create', as: 'create_transaction'
  get 'transactions/debtlist/:id', to:'transactions#debtlist', as: 'debtlist'
  get 'transactions/creditlist/:id', to:'transactions#creditlist', as: 'creditlist'
  put 'transactions/:id', to:'transactions#update', as: 'update_transaction'

end