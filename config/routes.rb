Rails.application.routes.draw do
  root to: 'cocktails#index'

  get 'cocktails/new', to: 'cocktails#new'
  post 'cocktails', to: 'cocktails#create'

  get 'cocktails/:id/doses/new', to: 'doses#new', as: 'cocktail_doses_new'
  post 'cocktails/:id/doses', to: 'doses#create', as: 'cocktail_doses'

  get 'cocktails', to: 'cocktails#index'
  get 'cocktails/:id', to: 'cocktails#show', as: 'cocktail'
end
