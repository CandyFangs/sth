Rails.application.routes.draw do
  resources :students do
    resources :subjects
  end
  root 'visitors#index'
  devise_for :users
  resources :teachers do
    get :subjects
  end
  get 'reports/subjects', to: 'reports#subjects', as: 'report_subjects'
end
