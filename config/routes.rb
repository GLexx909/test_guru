Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/tests/:id', to: redirect('/tests/%{id}/questions')
  resources :tests, except: :show do
    resources :questions, shallow: true
  end
end
