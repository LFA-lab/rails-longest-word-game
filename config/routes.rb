Rails.application.routes.draw do
  get 'new', to: "games#new", as: :new
  post 'score', to: "games#score", as: :score

  # Route de vérification de santé
  get "up" => "rails/health#show", as: :rails_health_check

  # Définition de la route root si nécessaire
  # root "posts#index"
end
