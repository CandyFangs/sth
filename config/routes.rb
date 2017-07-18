Rails.application.routes.draw do
  resources :students do
    get :subjects
    resources :payments
  end
  resources :payments, only: %I(new create)
  root 'visitors#index'
  devise_for :users
  resources :teachers do
    get :subjects
  end
  get 'reports/subjects', to: 'reports#subjects', as: 'report_subjects'
  get 'reports/payments', to: 'reports#payments', as: 'report_payments'
end
