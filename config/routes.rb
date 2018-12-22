Rails.application.routes.draw do
  resources :users
  mount SwaggerUiEngine::Engine, at: "/api_docs"

  namespace :api, format: "json" do
		namespace :v1 do
			resources :api_docs, only: [:index] unless Rails.env.production?
		end
	end
end
