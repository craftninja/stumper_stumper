Rails.application.routes.draw do

  root 'welcome#index'
  get '/about' => 'welcome#about', as: :about

  get '/games/new/:level' => 'games#new', as: :new_game
  get '/games/:id' => 'games#show', as: :game
  post '/games/:id' => 'games#guess'

end
