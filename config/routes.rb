Rails.application.routes.draw do
  resources :students do
    get :subjects
  end
  root 'visitors#index'
  resources :teachers
  resources :reports do
    get :subjects
  end
end
