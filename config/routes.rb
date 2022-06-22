Rails.application.routes.draw do
  resources :saunas
  devise_for :users, :controllers => {
    :confirmations => 'users/confirmations',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
   }
  devise_scope :user do
    get 'mypage', to: 'users/registrations#show', as: :mypage_registration
  end

  resources :timers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'timers#index'

  resources :timers do
    member do
      get :sauna_end ,action: :sauna_end
      get :water_start, action: :water_start
      get :water_end, action: :water_end
      get :outside_start, action: :outside_start
      get :outside_end, action: :outside_end
      patch :update2, action: :update2
      patch :update3, action: :update3
      patch :update4, action: :update4
      patch :update5, action: :update5
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end


  %w(get put patch post delete).each do |method|
    send(method, '*something', controller: :application, action: :render_404)
  end

end
