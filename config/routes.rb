Rails.application.routes.draw do
  get "notes" => "notes#index"
  post "notes" => "notes#create"
  get "notes/:id" => "notes#show"
  post "notes/:index" => "notes#update"
  post "update_index" => "notes#update_index"
  delete "notes/:index" => "notes#destroy"
end
