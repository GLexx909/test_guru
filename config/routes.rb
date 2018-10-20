Rails.application.routes.draw do

  # resources :gists
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
   controllers: { sessions: 'users/sessions'}

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: [:show, :update] do
    member do
      get :result
      post :gist
    end
  end

  get 'contact_us', to: 'contact_us#show_form'
  post 'contact_us/send_mail', to: 'contact_us#send_mail'

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
  end

end
