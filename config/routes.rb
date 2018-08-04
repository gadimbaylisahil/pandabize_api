Rails.application.routes.draw do
  resources :bicycles do
    resources :options do
      resources :option_values, only: %i[index show create destroy]
    end
  end
end
