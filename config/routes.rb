Rails.application.routes.draw do
	resources :bicycles do
		resources :options
	end
end
