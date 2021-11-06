Rails.application.routes.draw do
  # resources :survey
  get 'survey/:id', to: 'survey#show', as: 'survey'
  post 'survey/:id', to: 'survey#create'
end
