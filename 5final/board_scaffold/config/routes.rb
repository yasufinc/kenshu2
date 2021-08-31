Rails.application.routes.draw do
  resources :my_threads do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'my_threads#index'
end
