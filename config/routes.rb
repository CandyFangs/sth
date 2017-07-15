Rails.application.routes.draw do
  resources :students do
    get :subjects
  end
  root 'students#index'
  resources :teachers
  resources :reports do
    get :subjects
  end
end
