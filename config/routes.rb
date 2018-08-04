Rails.application.routes.draw do
  resources :bicycles do
    resources :options do
      resources :option_values, only: %i[index show destroy]
    end
	  resources :variants, only: %i[index show update destroy]
  end
end
