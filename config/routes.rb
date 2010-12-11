SendFileImageExample::Application.routes.draw do
  
  match "/images/:name" => "images#show"
  resources :user_images
  root :to => "user_images#index"
end