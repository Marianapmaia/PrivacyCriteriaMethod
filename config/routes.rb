Rails.application.routes.draw do
  resources :privacy_criteria
  resources :projects
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#index'
  get 'whatisthis' => 'home#wit'
  get 'docen' => "home#doc-en"
  get 'docbr' => "home#doc-br"
  get 'catalog' => "home#catalog"
  get 'case_study' => "home#case_study"
  
  get 'add_share' => "share#add"
  post 'remove_share' => "share#remove"
end
