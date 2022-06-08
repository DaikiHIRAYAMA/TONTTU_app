Rails.application.routes.draw do
  resources :timers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

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
end
