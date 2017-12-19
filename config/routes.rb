Rails.application.routes.draw do
  resources :encrypteds
  resources :keys
  
  post 'rsas' => 'create_key#generate'
  get 'rsas/:id' => 'create_key#get_key'
  post 'rsas/:id/encrypt_messages' => 'encrypt#encrypt'
  get 'rsas/:id/encrypt_messages/:mess_id' => 'encrypt#get_message'
  post 'rsas/:id/decrypt_messages' => 'decrypt#decrypt'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
