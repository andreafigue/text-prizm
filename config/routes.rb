Rails.application.routes.draw do
  
  devise_for :user, :controllers => { registrations: 'registrations' }

  authenticate :user do

    get 'admin/upload', "admin#upload"
    post 'admin/upload'
    get 'admin/list', "admin#list"

  	get "welcome/index", 'welcome#index'
    get "welcome/batches", 'welcome#batches'
    get "welcome/to_csv/:batch_id" => "welcome#to_csv", as: "to_csv"

    get "coding/index/:batch_id" => "coding#index"

  	post "coding/add_code", "coding#add_code"
  	post "coding/remove_code", "coding#remove_code"

  	post "coding/add_topic", "coding#add_topic"
  	post "coding/remove_topic", "coding#remove_topic"

  	post "coding/add_valence", "coding#add_valence"
  	post "coding/remove_valence", "coding#remove_valence"
  end

  root "welcome#index"
	  #root 'welcome#index'
	  
	  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
