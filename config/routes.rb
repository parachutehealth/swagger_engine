SwaggerEngine::Engine.routes.draw do
  resources :callbacks, only: [:index]
  resources :swaggers, only: [:index, :show]
  root to: 'swaggers#index'
end
